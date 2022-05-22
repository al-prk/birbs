class Consume::V1::Task
  include Interactor

  delegate :message, to: :context

  def call
    Task.create(message.merge(jira_id: jira_id))
  end


  def jira_id
    s.match(%r{\[(\S+)\]})&.[](1)
  end
end