const express = require('express');

const app = express();
const port = 8080;

app.get('/', function(req, res){
    res.send('Hello Node Express');
});

app.listen(port, () => console.log('Express App listening on port: ' + port));
