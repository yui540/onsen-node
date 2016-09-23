'use strict';

var request = require('request');

/**
 * 番組一覧の表示
 */
exports.list = (callback) => {
	var url = 'http://www.onsen.ag/api/shownMovie/shownMovie.json';
	request(url, (err, res, body) => {
		if(res.statusCode === 200 && !err)
			callback(JSON.parse(body).result);
	});	
};

/**
 * 番組情報の取得
 * @param name: 番組名
 */
exports.get = (name, callback) => {
	var url = 'http://www.onsen.ag/data/api/getMovieInfo/';
	request(url+name, (err, res, body) => {
		if(res.statusCode === 200 && !err) {
			var data = body.replace(/(callback\(|\);)/g, '');
			callback(JSON.parse(data));
		}
	});
};

/**
 * 番組の検索
 * @param keyword: 検索ワード
 */
exports.search = (keyword, callback) => {
	var url = 'http://www.onsen.ag/data/api/searchMovie?word=';
	request(url+keyword, (err, res, body) => {
		if(res.statusCode === 200 && !err) {
			var data = body.replace(/(callback\(|\);)/g, '');
			callback(JSON.parse(data).result);
		}
	});
};