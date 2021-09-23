# rabbit-poc
RabbitMQ Send/Receive

## Installation:
Installing RabbitMQ from docker, making Management Plugin accessable on port 8001 and rabbit connection on port 5672.
for more info visit: https://hub.docker.com/_/rabbitmq

    $ docker run -d --hostname rabbit.local --name rabbit -p 8001:15672 -p 5672:5672 rabbitmq:3-management

    $ gem install amazing_print
    $ gem install bunny

### Publishing:

    $ ruby publisher.rb

this will publish a hash message to the queue `hello`


### Receiving:

    $ ruby listener.rb

you can run as mush as you want listener and rabbit will send a message the first available listener.


### Refs:

https://www.rabbitmq.com/tutorials/tutorial-one-ruby.html

https://www.rabbitmq.com/confirms.html

http://localhost:8001
