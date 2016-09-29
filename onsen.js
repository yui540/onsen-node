'use strict';

function Onsen() {
	// end_point
	this.LIST_URL = 'http://www.onsen.ag/api/shownMovie/shownMovie.json';
	this.GET_URL = 'http://www.onsen.ag/data/api/getMovieInfo/';
	this.SEARCH_URL = 'http://www.onsen.ag/data/api/searchMovie?word=';
	this.RECOMMENDS_URL = 'http://www.onsen.ag/app/recommends.xml';
	this.TOPICS_URL = 'http://www.onsen.ag/blog/?feed=rss2&cat=-2';
	// module
	this.request = require('request');
	this.xmljson = require('xmljson');
}

/**
 * 番組一覧の取得
 * @param callback: コールバック関数
 */
Onsen.prototype.list = function(callback) {
	this.request(this.LIST_URL, function(err, res, body) {
		if(res.statusCode === 200  && err === null) {
			callback(JSON.parse(body).result);
		} else {
			callback(null);
		}
	});
};

/**
 * 番組情報の取得
 * @param name: 番組名
 * @param callback: コールバック関数
 */
Onsen.prototype.get = function(name, callback) {
	name = encodeURIComponent(name);
	this.request(this.GET_URL+name, function(err, res, body) {
		if(res.statusCode === 200  && err === null) {
			var data = body.replace(/(callback\(|\);)/g, '');
			callback(JSON.parse(data));
		} else {
			callback(null);
		}
	});
};

/**
 * 番組の検索
 * @param keyword: 検索ワード
 * @param callback: コールバック関数
 */
Onsen.prototype.search = function(keyword, callback) {
	keyword = encodeURIComponent(keyword);
	this.request(this.SEARCH_URL+keyword, function(err, res, body) {
		if(res.statusCode === 200  && err === null) {
			var data = body.replace(/(callback\(|\);)/g, '');
			callback(JSON.parse(data));
		} else {
			callback(null);
		}
	});
};

/**
 * レコメンドの取得
 * @param callback: コールバック関数
 */
Onsen.prototype.recommends = function(callback) {
	var self = this;
	this.request(this.RECOMMENDS_URL, function(err, res, xml) {
		if(res.statusCode === 200  && err === null) {
			self.xmljson.to_json(xml, function(err, data) {
				console.log(data);
			});
		} else {
			callback(null);
		}
	});
};

/**
 * トピックの取得
 * @param callback: コールバック関数
 */
Onsen.prototype.topics = function(callback) {
	var self = this;
	this.request(this.TOPICS_URL, function(err, res, xml) {
		if(res.statusCode === 200  && err === null) {
			self.xmljson.to_json(xml, function(err, data) {
				callback(data.rss.channel.item);
			});
		} else {
			callback(null);
		}
	});
};

module.exports = Onsen;