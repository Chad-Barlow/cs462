var args = require("minimist")(process.argv.slice(2));
 
var event_type = args.e || "hello";
var message = args.m || "";
 
var request = require("request");
// must be an eci to a pico with the echo_server ruleset or similar installed
var eci = "cj004fk1h0002emao22kqqtca";
var eid = "my-event-id";
var pico_engine = "localhost:8080";
 
var url = "http://"+pico_engine+"/sky/event/"+eci+"/"+eid+"/echo/"+event_type;
request.post(url,{form:{input:message}},function(err,response,body){
  JSON.parse(body).directives.forEach(function(d){
    if (d.name === "say"){
      console.log(d.options.something);
    }
  });
});
