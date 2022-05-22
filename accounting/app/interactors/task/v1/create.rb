class Task::V1::Create
  include Interactor

  delegate :message, :task, to: :context

  def call
    context.task = Task.create(message.merge(jira_id: jira_id))
  end


  def jira_id
    message['title'].match(%r{\[(\S+)\]})&.[](1)
  end
end