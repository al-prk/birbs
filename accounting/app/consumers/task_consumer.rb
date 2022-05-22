class TaskConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      interaction(message).call(message: message)
    end
  end

  def interaction(message)
    "consume/v#{message['event_version']}/task".classify.constantize
  end
end