#!/usr/bin/env node
command = require './command'

mode = process.argv[2]
text = process.argv[3]

if mode is '-h' or mode is '--help'
	# ヘルプ
	command.help()
else if mode is 'list'
	# 番組一覧
	command.list text
else if mode is 'search'
	# 検索
	command.search text
else if mode is 'download'
	# ダウンロード
	command.download text
else if mode is 'info'
	# 番組情報
	command.info text
else
	command.help()