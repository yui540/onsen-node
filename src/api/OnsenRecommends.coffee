class OnsenRecommends
	constructor: ->
		@url     = require('../OnsenURL').RECOMMENDS
		@request = require 'request'
		@xmljson = require 'xmljson'
		@help    = require '../help'

	##
	# レコメンドの取得
	# @param fn : コールバック関数
	##
	getRecommends: (fn) ->
		@request @url, (err, res, xml) =>
			if res.statusCode is 200 and err is null
				@xmljson.to_json xml, (err, data) ->
					fn data.recommends.recommend
			else
				fn null
	
module.exports = new OnsenRecommends()