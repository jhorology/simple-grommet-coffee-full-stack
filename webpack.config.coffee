path               = require 'path'
HtmlWebpackPlugin  = require 'html-webpack-plugin'
CleanWebpackPlugin = require 'clean-webpack-plugin'

loader = (name, opts) ->
  if opts
    loader: name
    options: opts
  else
    name

module.exports =
  entry: [
    './src/client/index.coffee'
  ]
  output:
    path: path.join(__dirname, 'dist')
    filename: 'bundle.js'
  module:
    rules: [{
      test: /\.coffee$/
      exclude: /node_modules/
      use: [
        loader 'babel-loader'
        loader 'coffee-loader',
          sourceMap: on
      ]
    }
    {
      test: /\.css$/
      use: [
        loader 'style-loader'
        loader 'css-loader'
      ]
    }
    {
      test: /\.(png|woff|woff2|eot|ttf|svg)$/
      use: [
        loader 'url-loader',
          limit: 100000
      ]
    }]
  resolve:
    extensions: ['.coffee', '.js', '.jsx']
  devServer:
    port: 3000
    open: true
    proxy: {
      '/api': 'http://localhost:8080'
    }
  plugins: [
    new CleanWebpackPlugin()
    new HtmlWebpackPlugin
      template: './public/index.html'
      favicon: './public/favicon.ico'
  ]
