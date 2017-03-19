'use strict'

var request = require('superagent');


const callback_url = 'http://192.168.1.108:3000/scoring/999'

const script = "#! /usr/bin/env bash  \\n   node ./hello.js \\n "  // 必须用两个 slash，因为 jenkins 的 echo 需要这样

const taskApi = 'http://afaren.graduation.design:8088/job/HOMEWORK_SCORING/buildWithParameters'


var info = {
	callback_url: callback_url,
	image: 'node:5.8',
	script: script,
    user_answer_repo: 'https://github.com/Afaren/for-recruiting-system-homework-test.git'

};


request
	.post(taskApi)
	.auth('twars', 'twars')
	.type('form')
	.send(info)
	.end((err, res) => {
		console.log(err);
		console.log(res.statusCode);
	});



