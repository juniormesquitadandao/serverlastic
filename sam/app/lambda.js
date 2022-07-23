'use strict';

const axios = require('axios');
const shell = require('shelljs');
const fs = require('fs');
const logFile = '/tmp/serverlastic.log';

const server = async seconds => {
  try {
    shell.config.fatal = true;

    console.log('unzipping...');
    shell.exec('unzip -q /home/user/serverlastic.zip -d /tmp');
    shell.exec(`sleep ${seconds.unzip}s`);

    console.log('starting...');
    shell.exec(`devops/server/start.sh 2> ${logFile}`, { async: true });
    shell.exec(`sleep ${seconds.start}s`);
  } catch (error) {
    fs.writeFileSync(logFile, error.message);
  }
}

const request = async event => axios.request({
  withCredentials: true,
  method: event.requestContext.http.method,
  headers: Object.keys(event.headers).reduce((o, k) => {
    const v = event.headers[k];

    if (k.toUpperCase() !==  'ORIGIN')
      o[k] = v;

    if (k.toUpperCase() ===  'HOST')
      o['X-Forwarded-Host'] = v;

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
  body: typeof response?.data === 'object' ? JSON.stringify(response.data) : response?.data || fs.readFileSync(logFile).toString() || message
});

if (process.env.NODE_ENV === 'test')
  server({unzip: 0.0, start: 1.1});
else
  server({unzip: 0.1, start: 5.9});

exports.handler = async event => request(event).then(success).catch(fail);
