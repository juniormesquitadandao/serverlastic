'use strict';

const axios = require('axios');
const shell = require('shelljs');
const fs = require('fs');
const successLog = '/tmp/serverlastic.success';
const failLog = '/tmp/serverlastic.fail';

const server = async ({seconds, successMessage}) => {
  if (fs.existsSync(successLog))
    return;

  shell.config.fatal = true;

  shell.exec(`touch ${successLog}`);
  shell.exec(`touch ${failLog}`);
  shell.exec(`devops/server/start.sh 2> ${failLog} | tee ${successLog}`, { async: true });
  console.log('starting...');

  while(!fs.readFileSync(successLog).toString().includes(successMessage) && !fs.readFileSync(failLog).toString()) {
    console.log(`awaiting +${seconds}s...`);
    shell.exec(`sleep ${seconds}s`);
  }
}

const request = async event => axios.request({
  withCredentials: true,
  method: event.requestContext.http.method,
  headers: Object.keys(event.headers).reduce((o, k) => {
    const v = event.headers[k];
    const K = k.toUpperCase();

    if ( ['ORIGIN', 'HOST', 'REFERER'].includes(K) )
      o[`X-FORWARDED-${K}`] = v;
    else
      o[K] = v;

    return o;
  }, {}),
  url: event.requestContext.http.path,
  data: event.isBase64Encoded ? Buffer.from(event.body, 'base64').toString('utf8') : event.body,
  params: event.queryStringParameters,
  maxRedirects: 0,
  proxy: {
    protocol: 'http',
    host: '127.0.0.1',
    port: 9000
  },
  decompress: false,
});

const success = response => ({
  statusCode: response.status,
  headers: Object.keys(response.headers).reduce((o, k) => {
    const v = response.headers[k];

    if (v instanceof Array)
      o[k] = v.join(',');
    else
      o[k] = v;

    return o;
  }, {}),
  body: typeof response.data === 'object' ? JSON.stringify(response.data) : response.data,
  isBase64Encoded: false
});

const fail = ({response, message}) => ({
  statusCode: response?.status || 500,
  headers: Object.keys(response?.headers || {}).reduce((o, k) => {
    const v = response.headers[k];

    if (v instanceof Array)
      o[k] = v.join(',');
    else
      o[k] = v;

    return o;
  }, {}),
  body: typeof response?.data === 'object' ? JSON.stringify(response.data) : response?.data || fs.readFileSync(failLog).toString() || message
});

server({seconds: 0.5, successMessage: 'http://'});

exports.handler = async event => request(event).then(success).catch(fail);
