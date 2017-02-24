class OnsenSearch
	constructor: ->
		@url     = require('../OnsenURL').SEARCH
		@request = require 'request'
		@help    = require '../help'

	##
	# 番組の検索
	# @param keyword : 検索ワード
	# @param fn      : コールバック関数
	##
	search: (keyword, fn) ->
		keyword = encodeURIComponent keyword
		@request @url + keyword, (err, res, body) =>
			if res.statusCode is 200 and err is null
				data = @help.catJSONP body
				data = JSON.parse data
				data = data.result || []
				fn data
			else
				fn null

module.exports = new OnsenSearch()