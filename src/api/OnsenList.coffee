class OnsenList
	constructor: ->
		@url     = require('../OnsenURL').TOP
		@cheerio = require 'cheerio-httpcli'

	##
	# 番組一覧の取得
	# @param fn : コールバック関数
	##
	getList: (fn) ->
		list = {}
		@cheerio.fetch @url, (err, $, res) =>
			if err 
				fn null
			else
				$('.listWrap .clr li').each ->
					name = $(this).attr 'id'
					week = $(this).attr 'data-week'

					if list[week] is undefined
						list[week] = []

					list[week].push name

				fn list

module.exports = new OnsenList()