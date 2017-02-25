module.exports = 
	##
	# jsonpをjsonに変換
	# @param  jsonp : jsonp
	# @return json  : json
	##
	catJSONP : (jsonp) ->
		json = jsonp.replace /(callback\(|\);)/g, ''
		return json

	##
	# 配列に変換
	# @param  list  : レコメンドリスト
	# @return array : 配列
	##
	castArray: (list) ->
		_list = []
		for key, data of list
			_list.push data

		return _list

	##
	# http通信
	# @param url : URL
	# @param fn  : コールバック関数
	##
	httpRequest: (url, fn) ->
		request = require 'request'
		request url, (err, res, body) =>
			if res.statusCode is 200 and err is null
				fn body
			else
				fn null