require 'json'
require 'bunny'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue('hello')
# 100.times do |i|
#   channel.default_exchange.publish("Hello there #{i}", routing_key: queue.name)
# end
channel.default_exchange.publish({ name: 'john', lastname: 'doe' }.to_json, routing_key: queue.name)
connection.close
