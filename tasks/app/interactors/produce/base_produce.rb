module Produce
  class BaseProduce
    include Interactor

    delegate :message, :task, to: :context

    protected

    def version
      Settings.dig(subject, :version)
    end

    def validate?
      SchemaRegistry.validate_event(message, event_name, version: version)
    end
  end
end