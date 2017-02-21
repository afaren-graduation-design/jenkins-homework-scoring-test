'use strict'

var request = require('superagent');


const stack = 'javascript'

const options = {
	userAnswerRepo: 'https://github.com/Afaren/for-recruiting-system-homework-test.git',
	branch: 'master'
}

const callback_url = 'http://10.205.125.183:3000/scoring/999'

const script = `
#! /usr/bash 
node ./hello.js
`.toString().split('\n').join('\\n');


var info = {
	script: script,
	user_answer_repo: options.userAnswerRepo,
	branch: options.branch,
	callback_url: callback_url,
	stack: stack
};


const taskApi = 'http://local.thoughtworks.school:8080/job/HOMEWORK_SCORING/buildWithParameters'

function done(err, res){
	console.log(err);
	console.log(res.statusCode);
}


request
	.post(taskApi)
	.auth('twars', 'twars')
	.type('form')
	.send(info)
	.end((err, res) => {
		done(err, res)
	});



