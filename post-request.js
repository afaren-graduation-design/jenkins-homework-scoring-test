'use strict'

var request = require('superagent');

const script = `
#! /usr/bash 
echo '==================================================in script==========================================='
`.toString().split('\n').join('\\n');

const options = {
	userAnswerRepo: 'https://github.com/Afaren/for-recruiting-system-homework-quiz-test.git',
	branch: 'master'
}

const callback_url = 'http://10.205.125.183:3000/scoring/999'
const stack = 'python'


var info = {
	script: script,
	user_answer_repo: options.userAnswerRepo,
	branch: options.branch,
	callback_url: callback_url,
	stack: stack
};


const taskApi = 'http://local.thoughtworks.school:8088/job/HOMEWORK_SCORING/buildWithParameters'

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



