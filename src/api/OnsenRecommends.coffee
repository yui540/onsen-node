class OnsenRecommends
	constructor: ->
		@url_1   = require('../OnsenURL').RECOMMENDS
		@url_2   = require('../OnsenURL').DEFAULT
		@xmljson = require 'xmljson'
		@help    = require '../help'

	##
	# レコメンドの取得
	# @param fn : コールバック関数
	##
	getRecommends: (fn) ->
		@help.httpRequest @url_1, (xml) =>
			if xml isnt null
				@xmljson.to_json xml, (err, data) =>
					data = @help.castArray data.recommends.recommend
					fn data
			else
				fn null

	##
	# おすすめ番組の取得
	# @param fn : コールバック関数
	##
	getRecommendMovie: (fn) ->
		@help.httpRequest @url_2, (jsonp) =>
			if jsonp isnt null
				json = @help.catJSONP jsonp
				json = JSON.parse json
				fn json.recommendMovie
			else
				fn null

	##
	# おすすめ商品の取得
	# @param fn : コールバック関数
	##
	getRecommendGoods: (fn) ->
		@help.httpRequest @url_2, (jsonp) =>
			if jsonp isnt null
				json = @help.catJSONP jsonp
				json = JSON.parse json
				fn json.recommendGoods
			else
				fn null
	
module.exports = new OnsenRecommends()