module Produce
  class TaskAdded < BaseProduce
    include Interactor

    delegate :message, :task, to: :context

    def call
      fail!(error: :invalid_schema) unless validate?

      WaterDrop::SyncProducer.call(message, topic: event_name)
    end

    def message
      @message ||= serializer.new(task).serializable_hash.to_json
    end

    private

    def serializer
      "v#{version}/task_serializer".classify.constantize
    end

    def subject
      :tasks
    end

    def event_name
      'Tasks.Added'
    end
  end
end
