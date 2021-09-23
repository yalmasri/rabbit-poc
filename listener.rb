require 'amazing_print'
require 'json'
require 'bunny'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue('hello')

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  sleep 2
  queue.subscribe(block: true) do |delivery_info, properties, body|
    puts "Info:"
    ap delivery_info
    puts '--------------------------------------'
    puts "Props:"
    ap properties
    puts '--------------------------------------'
    puts "[x] Received:"
    ap JSON.parse(body)
    puts "======================================\n\n"
  end
rescue Interrupt
  connection.close

  exit(0)
end
