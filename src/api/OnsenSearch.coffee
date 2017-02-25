class OnsenSearch
	constructor: ->
		@url     = require('../OnsenURL').SEARCH
		@help    = require '../help'

	##
	# 番組の検索
	# @param keyword : 検索ワード
	# @param fn      : コールバック関数
	##
	search: (keyword, fn) ->
		keyword = encodeURIComponent keyword
		@help.httpRequest @url + keyword, (jsonp) =>
			if jsonp isnt null
				json = @help.catJSONP jsonp
				json = JSON.parse json
				json = json.result || []
				fn json
			else
				fn null

module.exports = new OnsenSearch()