'use strict';

const left = id => Object.assign(document.getElementById(id).style, {'margin-left': '0px', 'margin-right': 'auto'});
const center = id => Object.assign(document.getElementById(id).style, {'margin-left': 'auto', 'margin-right': 'auto'});
const right = id => Object.assign(document.getElementById(id).style, {'margin-left': 'auto', 'margin-right': '0px'});
