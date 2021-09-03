const path = require('path');

module.exports = {
    entry: {
        all: './js/site.js',
        analytics: './js/analytics.js'
    },
    output: {
        filename: '[name].js',
        path: path.resolve(__dirname, 'source/javascripts'),
    },
};