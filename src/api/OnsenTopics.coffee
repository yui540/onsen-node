class OnsenTopics
	constructor: ->
		@url     = require('../OnsenURL').TOPICS
		@xmljson = require 'xmljson'
		@help    = require '../help'

	##
	# トピックの取得
	# @param fn : コールバック関数
	##
	getTopics: (fn) ->
		@help.httpRequest @url, (xml) =>
			if xml isnt null
				@xmljson.to_json xml, (err, json) =>
					json = @help.castArray json.rss.channel.item
					fn json
			else
				fn null
	
module.exports = new OnsenTopics()