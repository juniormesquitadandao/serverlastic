'use strict';

const fs = require('fs');
const lambda = require('../../app/lambda.js');

describe('Lambda', () => {
  it('must return html', async () => {
    const event = require('../events/html.json');
    const html = fs.readFileSync('/tmp/serverlastic/app/index.html');

    const response = await lambda.handler(event);

    expect(response.body).toEqual(html.toString());
  });

  it('must return css', async () => {
    const event = require('../events/css.json');
    const css = fs.readFileSync('/tmp/serverlastic/app/style.css');

    const response = await lambda.handler(event);

    expect(response.body).toEqual(css.toString());
  });

  it('must return js', async () => {
    const event = require('../events/js.json');
    const js = fs.readFileSync('/tmp/serverlastic/app/script.js');

    const response = await lambda.handler(event);

    expect(response.body).toEqual(js.toString());
  });

  it('must return json', async () => {
    const event = require('../events/json.json');
    const json = fs.readFileSync('/tmp/serverlastic/app/data.json');

    const response = await lambda.handler(event);

    expect(JSON.parse(response.body)).toEqual(JSON.parse(json.toString()));
  });

  it('must return csv', async () => {
    const event = require('../events/csv.json');
    const csv = fs.readFileSync('/tmp/serverlastic/app/data.csv');

    const response = await lambda.handler(event);

    expect(response.body).toEqual(csv.toString());
  });
});
