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
    select when echo message input re#(.*)# setting(mileage);
    send_directive("trip") with
      trip_length = mileage
  }
}
