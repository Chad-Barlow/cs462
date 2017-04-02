ruleset echo {
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
  
  rule hello {
    select when echo hello
    send_directive("say") with
      something = "Hello World"
  }
  
  rule message {
    select when echo message input re#(.*)# setting(m);
    send_directive("say") with
      something = m
  }
}
