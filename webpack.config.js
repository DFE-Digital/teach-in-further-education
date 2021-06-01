const path = require('path');

module.exports = {
    entry: './js/site.js',
    output: {
        filename: 'all.js',
        path: path.resolve(__dirname, 'source/javascripts'),
    },
};