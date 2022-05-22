class Consume::V2::Task
  include Interactor

  delegate :message, to: :context

  def call
    fail(error: 'wrong title') if title.include?('[') || title.include?(']')

    Task.create(message)
  end

  def title
    message['title']
  end
end