'use strict';

const axios = require('axios');
const shell = require('shelljs');
const fs = require('fs');
const logFile = '/tmp/serverlastic.log';

shell.config.fatal = true;
shell.exec(`devops/server/init.sh 2> ${logFile}`, { async: true });
shell.exec('sleep 0.100s');

const request = async event => axios.request({
  withCredentials: true,
  method: event.requestContext.http.method,
  headers: {
    ...event.headers,
    Cookie: (event.cookies || []).join('; ')
  },
  url: event.requestContext.http.path,
  data: event.isBase64Encoded ? atob(event.body) : event.body,
  maxRedirects: 0,
  proxy: {
    port: 9000
  }
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
  body: typeof response.data === 'object' ? JSON.stringify(response.data) : response.data
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

exports.handler = async event => request(event).then(success).catch(fail);
