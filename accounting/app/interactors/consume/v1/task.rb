class Consume::V1::Task
  include Interactor::Organizer

  organize Task::V1::Create, TaskAccounting, TaskAudit
end