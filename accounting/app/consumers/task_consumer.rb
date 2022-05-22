class TaskConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      unless interaction(message).call(message: message).success?
        WaterDrop::SyncProducer.call(message, topic: 'task-deadletter')
      end
    end
  end

  def interaction(message)
    "consume/v#{message['event_version']}/task".classify.constantize
  end
end