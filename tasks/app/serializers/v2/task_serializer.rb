module V2
  class TaskSerializer < ::V1::TaskSerializer
    attribute :event_version, -> { 1 }
    attributes :jira_id
  end
end
