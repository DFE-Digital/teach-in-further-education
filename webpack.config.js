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
    module: {
        rules: [{
            test: /\.m?js$/,
            exclude: /(node_modules)/,
            use: {
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/preset-env']
                }
            }
        }]
    }
};

