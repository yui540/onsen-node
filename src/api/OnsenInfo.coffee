class OnsenInfo
	constructor: ->
		@url  = require('../OnsenURL').GET_INFO
		@help = require '../help'

	##
	# 番組情報の取得
	# @param name : 番組名
	# @param fn   : コールバック関数
	##
	getInfo: (name, fn) ->
		name = encodeURIComponent name
		@help.httpRequest @url + name, (jsonp) =>
			if jsonp isnt null
				json = @help.catJSONP jsonp
				json = JSON.parse json

				if json.error isnt undefined
					fn null
					return

				fn json
			else
				fn null

	##
	# 音声 or 動画ファイルのリンクを取得
	##
	getLink: (name, fn) ->
		@getInfo name, (info) =>
			if info isnt null
				link = info.moviePath.pc
				fn link
			else
				fn null

module.exports = new OnsenInfo()