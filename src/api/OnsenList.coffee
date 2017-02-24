class OnsenList
	constructor: ->
		@url     = require('../OnsenURL').LIST
		@request = require 'request'

	##
	# 番組一覧の取得
	# @param fn : コールバック関数
	##
	getList: (fn) ->
		@request @url, (err, res, body) =>
			if res.statusCode is 200 and err is null
				fn JSON.parse(body).result
			else
				fn null

module.exports = new OnsenList()