//https://webpack.js.org/configuration/
const path = require('path');

module.exports = {
  entry: './src/app.js',//where it should start
  output: {
    path: path.join(__dirname, 'public'),
    filename: 'bundle.js'
  },
  module: {
    rules: [{
      loader: 'babel-loader',
      test: /\.js$/,
      exclude: /node_modules/
    },
    {
      test: /\.s?css$/,
      use: [
        'style-loader',
        'css-loader',
        'sass-loader'
      ]
    }]
  },
  devtool:'cheap-module-eval-source-map', //it helps to find an error
  devServer: {
    contentBase: path.join(__dirname, 'public')
  }
};

//loader -- it lets you customerize the behavior of webpack