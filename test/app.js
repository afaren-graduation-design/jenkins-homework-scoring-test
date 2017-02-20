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

app.get('/scoring', (req, res)=> {
	console.log('GET /scoring');
    res.send(req.query.name);
});


app.post('/scoring', (req, res)=> {
	console.log('POST /scoring');
	res.send(req.get('name'));
});

app.put('/scoring/:id', (req, res)=> {
	console.log('PUT /scoring/:id');
	res.send(req.body.name);
});

app.listen(3000, ()=> {
	    console.log('Example app listening on port 3000!');
});

module.exports = app;


