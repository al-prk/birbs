class TaskAudit
  include Interactor

  delegate :task, :account, :delta, to: :context

  def call
    Audit.create(task_id: task.id, account_id: account.id, delta: delta)
  end
end