class Task::V2::Create
  include Interactor

  delegate :message, :task, to: :context

  def call
    fail(error: 'wrong title') if title.include?('[') || title.include?(']')

    context.task = Task.create(message)
  end

  def title
    message['title']
  end
end