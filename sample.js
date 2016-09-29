'use strict';

var Onsen = require('./onsen');
var onsen = new Onsen();


/**
 * 番組一覧の取得
 */
onsen.list(function(data) {
	if(data !== null)
		console.log(data);
	else
		console.log('null');
});

/**
 * 番組情報の取得
 */
onsen.get(function('listで取得した番組名', data) {
	if(data !== null)
		console.log(data);
	else
		console.log('null');
});

/**
 * 番組の検索
 */
onsen.search(function('検索ワード', data) {
	if(data !== null)
		console.log(data);
	else
		console.log('null');
});

/**
 * レコメンドの取得
 */
onsen.recommends(function(data) {
	if(data !== null)
		console.log(data);
	else
		console.log('null');
});

/**
 * トピックの取得
 */
onsen.topics(function(data) {
	if(data !== null)
		console.log(data);
	else
		console.log('null');
});

