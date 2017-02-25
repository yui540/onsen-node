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