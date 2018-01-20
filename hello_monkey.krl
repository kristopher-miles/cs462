ruleset hello_world {
  meta {
    name "Hello World"
    description << A first ruleset for the Quickstart
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
  
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }
  
  rule hello_monkey {
    select when echo monkey
    pre{
      foo = event:attr("name").defaultsTo("monkey");
    }
    send_directive("say", {"something": hello(foo)})
    
  }
  
  rule hello_ternary {
    select when echo ternary
    pre{
      temp = event:attr("name").length();
      name = temp>0 => event:attr("name") | "monkey";
      
    }
    send_directive("say", {"something": hello(name)})
    
  }
  
}