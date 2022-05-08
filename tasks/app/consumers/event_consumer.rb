class EventsConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      User.create_with(message['data']).find_or_create_by(id: message.dig('data', 'id'))
    end
  end
end