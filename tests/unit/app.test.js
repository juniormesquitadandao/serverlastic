'use strict';

const fs = require('fs');
const app = require('../../src/app.js');

describe('App', () => {

  it('must return html', async () => {
    const event = require('../events/html.json');
    const html = fs.readFileSync('tests/server/index.html');

    const response = await app.handler(event);

    expect(response.body).toEqual(html.toString());
  });

  it('must return css', async () => {
    const event = require('../events/css.json');
    const css = fs.readFileSync('tests/server/style.css');

    const response = await app.handler(event);

    expect(response.body).toEqual(css.toString());
  });

  it('must return js', async () => {
    const event = require('../events/js.json');
    const js = fs.readFileSync('tests/server/script.js');

    const response = await app.handler(event);

    expect(response.body).toEqual(js.toString());
  });

  it('must return json', async () => {
    const event = require('../events/json.json');
    const json = fs.readFileSync('tests/server/data.json');

    const response = await app.handler(event);

    expect(JSON.parse(response.body)).toEqual(JSON.parse(json.toString()));
  });

  it('must return csv', async () => {
    const event = require('../events/csv.json');
    const csv = fs.readFileSync('tests/server/data.csv');

    const response = await app.handler(event);

    expect(response.body).toEqual(csv.toString());
  });
});
