onsen    = require '../onsen'
path     = require 'path'
suzu     = require 'suzu-downloader'
download = new suzu()

module.exports = 
	##
	# ヘルプ
	##
 	help: ->
 		console.log "\n
 			onsen-node CLI.\n
 			usage: onsen <command> [<args>]\n
 			\n
 			-h, --help             ヘルプ。\n
 			list      [<week>]     番組一覧\n
 			search     <keyword>   番組の検索\n
 			download   <name>      音声・動画ダウンロード\n
 			info       <name>      番組の情報\n
 		"

 	##
 	# 番組一覧 ルーティング
 	# @param week : 曜日[option]
 	##
 	list: (week) ->
 		onsen.getList (list) =>
 			if week is undefined
 				@listAll list
 			else
 				@listWeek list, week, ->

 	##
 	# 番組一覧
 	##
 	listAll: (list) ->
 		@showAll list, 0

 	##
 	# 番組一覧（曜日ごと）
 	# @param week : 曜日
 	##
 	listWeek: (list, week, fn) ->
 		week  = @castWeek week
 		_week = @kanaWeek week
 		_list = list[week]

 		console.log _week
 		@showTitle _list, 0, fn

 	##
 	# 曜日に変換
 	# @param  week : 曜日
 	# @return week : 曜日
 	##
 	castWeek: (week) ->
 		list  = ["sat", "mon", "tue", "wed", "thu", "fri", "sat"] 
 		date  = new Date()
 		today = list[date.getDay()]

 		if week is '月' or week is 'mon'
 			return list[1]
 		else if week is '火' or week is 'tue'
 			return list[2]
 		else if week is '水' or week is 'wed'
 			return list[3]
 		else if week is '木' or week is 'thu'
 			return list[4]
 		else if week is '金' or week is 'fri'
 			return list[5]
 		else if week is '土' or week is 'sat'
 			return list[6]
 		else if week is '日' or week is 'sun'
 			return list[0]
 		else if week is '今日' or week is 'today'
 			return today
 		else
 			return today

 	##
 	# 日本語の曜日に変換
 	# @param  week : 曜日
 	# @return week : 曜日
 	##
 	kanaWeek: (week) ->
 		list  = ["土・日", "月", "火", "水", "木", "金", "土・日"] 
 		date  = new Date()
 		today = list[date.getDay()]

 		if week is 'mon'
 			return list[1]
 		else if week is 'tue'
 			return list[2]
 		else if week is 'wed'
 			return list[3]
 		else if week is 'thu'
 			return list[4]
 		else if week is 'fri'
 			return list[5]
 		else if week is 'sat'
 			return list[6]
 		else if week is 'sun'
 			return list[0]
 		else if week is 'today'
 			return today
 		else
 			return today

 	##
 	# 番組タイトルの表示
 	# @param list : 番組一覧
 	# @param i    : カウンタ
 	# @param fn   : コールバック関数
 	##
 	showTitle: (list, i, fn) ->
 		len = list.length - 1
 		onsen.getInfo list[i], (info) =>
 			console.log '    [ ' + list[i] + ' ] ' + info.title

 			i += 1
 			if len <= i
 				fn()
 			else
 				@showTitle list, i, fn

 	##
 	# 番組一覧を全て表示
 	# @param list : 番組一覧
 	# @param i    : カウンタ
 	##
 	showAll: (list, i) ->
 		week  = ["mon", "tue", "wed", "thu", "fri", "sat"]
 		_week = @kanaWeek week[i]
 		len   = 5

 		console.log _week + '曜日'
 		@showTitle list[week[i]], 0, =>
 			if len <= i

 			else
 				i += 1
 				@showAll list, i

 	##
 	# 番組の検索
 	# @param keyword : 検索ワード
 	##
 	search: (keyword) ->
 		onsen.search keyword, (list) ->
 			if list.length <= 0
 				console.log "\n番組が見つかりませんでした。\n"
 				return

 			for name in list
 				onsen.getInfo name, (info) ->
 					console.log '[ ' + name + ' ] ' + info.title

 	##
 	# 番組の情報
 	# @param name : 番組名
 	##
 	info: (name) ->
 		onsen.getInfo name, (info) ->
 			if info is null
 				console.log '\n番組が見つかりませんでした。\n'
 				return

 			console.log "\n
 				title:       #{ info.title }\n
 				personality: #{ info.personality }\n
 				guest:       #{ info.guest }\n
 				update:      #{ info.update }\n
 				count:       #{ info.count }\n
 				schedule:    #{ info.schedule }\n
 				mail:        #{ info.mail }\n
 				file:        #{ info.moviePath.pc }\n
 			"

 	##
 	# 音声・動画のダウンロード
 	# @param name : 番組名
 	##
 	download: (name) ->
 		onsen.getInfo name, (info) ->
 			if info is null
 				console.log '\n番組が見つかりませんでした。\n'
 				return

 			link      = info.moviePath.pc
 			count     = info.count
 			ext       = path.extname link
 			file_name = name + '_' + count + ext

 			download.get {
 				url:  link
 				path: file_name
 			}