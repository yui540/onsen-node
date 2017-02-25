class OnsenTopics
	constructor: ->
		@url     = require('../OnsenURL').TOPICS
		@request = require 'request'
		@xmljson = require 'xmljson'
		@help    = require '../help'

	##
	# トピックの取得
	# @param fn : コールバック関数
	##
	getTopics: (fn) ->
		@request @url, (err, res, xml) =>
			if res.statusCode is 200 and err is null
				@xmljson.to_json xml, (err, data) =>
					fn @help.castArray data.rss.channel.item
			else
				fn null
	
module.exports = new OnsenTopics()