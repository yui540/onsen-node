onsen-node
***************************
Onsen API wrapper for Node.js

## Example

``` javascript:onsen.js
'use strict';

var onsen = require('./onsen');

/**
 * 番組一覧の取得
 */
onsen.list((data) => {
	console.log(data);
});

/**
 * 番組情報の取得
 */
onsen.get('[list]で取得した番組名', (data) => {
	console.log(data);
});

/**
 * 番組の検索
 */
onsen.search('検索キーワード', (data) => {
	console.log(data);
});
```