OnsenList       = require './api/OnsenList'
OnsenInfo       = require './api/OnsenInfo'
OnsenSearch     = require './api/OnsenSearch'
OnsenRecommends = require './api/OnsenRecommends'
OnsenTopics     = require './api/OnsenTopics'

module.exports =
	##
	# 番組一覧の取得
	# @param fn : コールバック関数
	##
	getList: (fn) ->
		OnsenList.getList fn

	##
	# 番組情報の取得
	# @param name : 番組名
	# @param fn   : コールバック関数
	##
	getInfo: (name, fn) ->
		OnsenInfo.getInfo name, fn

	##
	# 音声 or 動画リンクの取得
	# @param name : 番組名
	# @param fn   : コールバック関数
	##
	getLink: (name, fn) ->
		OnsenInfo.getLink name, fn

	##
	# 番組の検索
	# @param keyword : 検索ワード
	# @param fn      : コールバック関数
	##
	getSearch: (keyword, fn) ->
		OnsenSearch.search keyword, fn

	##
	# レコメンドの取得
	# @param fn : コールバック関数
	##
	getRecommends: (fn) ->
		OnsenRecommends.getRecommends fn

	##
	# おすすめ番組の取得
	# @param fn : コールバック関数
	##
	getRecommendMovie: (fn) ->
		OnsenRecommends.getRecommendMovie fn

	##
	# おすすめ商品の取得
	# @param fn : コールバック関数
	##
	getRecommendGoods: (fn) ->
		OnsenRecommends.getRecommendGoods fn

	##
	# トピックの取得
	# @param fn : コールバック関数
	##
	getTopics: (fn) ->
		OnsenTopics.getTopics fn