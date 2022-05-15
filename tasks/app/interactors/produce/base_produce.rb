module Produce
  class BaseProduce
    include Interactor

    delegate :message, :task, to: :context

    protected

    def version
      Settings.dig(subject, :version)
    end

    def validate?
      validation.success?
    end

    private

    def validation
      @validation ||= SchemaRegistry.validate_event(message, event_name.downcase, version: version)
    end
  end
end
