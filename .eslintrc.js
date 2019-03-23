const path = require('path');
const fs = require('fs');
const coffee = require('coffeescript');
const requireFromString = require('require-from-string');
module.exports = requireFromString(coffee.compile(fs.readFileSync(path.join(__dirname, '.eslintrc.coffee'), 'utf8')));
