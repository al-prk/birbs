$producer = WaterDrop::Producer.new

$producer.setup do |config|
  config.kafka = { 'bootstrap.servers': 'localhost:9092' }
end