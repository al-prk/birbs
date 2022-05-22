class Consume::V2::Task
  include Interactor::Organizer

  organize Task::V2::Create, TaskAccounting, TaskAudit
end