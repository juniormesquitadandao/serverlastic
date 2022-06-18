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
});
