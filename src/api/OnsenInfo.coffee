class OnsenInfo
	constructor: ->
		@url     = require('../OnsenURL').GET_INFO
		@request = require 'request'
		@help    = require '../help'

	##
	# 番組情報の取得
	# @param name : 番組名
	# @param fn   : コールバック関数
	##
	getInfo: (name, fn) ->
		name = encodeURIComponent name
		@request @url + name, (err, res, body) =>
			if res.statusCode is 200 and err is null
				data = @help.catJSONP body
				fn JSON.parse data
			else
				fn null

module.exports = new OnsenInfo()