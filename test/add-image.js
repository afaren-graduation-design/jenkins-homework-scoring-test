'use strict'

var request = require('superagent');


const callback_url = 'http://10.0.0.7:3000/scoring/999'


var info = {
	callback_url: callback_url,
	image: 'hello-world:latest'
};


const taskApi = 'http://local.thoughtworks.school:8088/job/ADD_IMAGE/buildWithParameters'

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



