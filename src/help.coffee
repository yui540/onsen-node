module.exports = 
	##
	# jsonpをjsonに変換
	# @param  jsonp : jsonp
	# @return json  : json
	##
	catJSONP : (jsonp) ->
		json = jsonp.replace /(callback\(|\);)/g, ''
		return json