path = require 'path'
HtmlWebpackPlugin = require 'html-webpack-plugin'
{ CleanWebpackPlugin } = require 'clean-webpack-plugin'



cmd =
	mode: 'development'
	devtool: 'inline-source-map'
	target: 'node'
	
	output:
		path: path.resolve __dirname, 'dist/cmd'
		filename: 'lib.node.js'



html =
	# name is key setting 必须设置这个.
	name: 'site'
	mode: 'development'
	devtool: 'inline-source-map'
	entry:
		d1: './src/d1.js',
		d2: './src/d2.js'
	

	output:
		path: path.resolve __dirname, 'dist/html'
		filename: '[name].[contenthash].js'
	plugins: [
		new CleanWebpackPlugin cleanStaleWebpackAssets: false
		new HtmlWebpackPlugin	title: 'Development'
	]


# with this, http://localhost:8080/ allways show dir /
#devServer:
#	contentBase: './dist/html'
#	publicPath: '/dist/html'




# if export this http://localhost:8080/ is right show index.ejs
#module.exports= html

# if export this http://localhost:8080/ is only show dir ./
module.exports = [ cmd, html ]

