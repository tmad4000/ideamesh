//load node_modules/coffee-script folder
require('coffee-script'); 

//var url = process.env.NEO4J_URL || 'http://localhost:7474';
//var url = 'http://localhost:7474/';
var url ='http://rhizi-space2:sVQCUXn6CVO3Vzm3ArZz@rhizispace2.sb02.stations.graphenedb.com:24789';
//var url ='http://mit100k:P134oFe0FGJJ16Ns9tia@mit100k.sb02.stations.graphenedb.com:24789';
// var url = 'http://rhizi-hackathonprojects:cfjNWHxnsKuX2MdJgCa7@rhizihackathonprojects.sb01.stations.graphenedb.com:24789';
// var url = 'http://wikinets-edge:wiKnj2gYeYOlzWPUcKYb@wikinetsedge.sb01.stations.graphenedb.com:24789';

//var url = 'http://wikinets-demo:BEmJ3fqsO02bHl9xay7X@wikinetsdemo.sb01.stations.graphenedb.com:24789';

//sosi
//var url = 'http://wikinets-sosi:yKenjgdUuhYXpcjevdNk@wikinetssosi.sb01.stations.graphenedb.com:24789';
//pims
//var url = 'http://wikinets-pims:GH9I6tXib6Zl9K5RmQBR@wikinetspims.sb01.stations.graphenedb.com:24789';


//load node_modules/neo4js folder
var neo4js = require('neo4js');

var graphDb = new neo4js.GraphDatabase4Node(url);

//console.log("THE URL IS: ", graphDb.url);

// includes wikinets.js
var App = require('./wikinets');

app = new App(graphDb);