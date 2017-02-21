'use strict';
const express = require('express');
let app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({extend: true}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
	console.log('/');
	res.send('multi-tech-stack');
});


app.put('/scoring/:id', (req, res)=> {
	console.log('PUT /scoring/:id');
	req.body.result = new Buffer(req.body.result || '', 'base64').toString('utf8');
	console.log(JSON.stringify(req.body,null, 2));
	res.send(req.body.name);
});

app.listen(3000, ()=> {
	    console.log('Example app listening on port 3000!');
});

module.exports = app;


