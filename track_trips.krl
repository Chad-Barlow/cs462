ruleset track_trips {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
  
  rule process_trip {
    select when echo message 
    pre {
      milage = event:attr("mileage"); //accessing event attributes
    }
    send_directive("trip") with //this is technically an action (in action block)
      trip_length = mileage
  }
}
