module V1
  class TaskSerializer < BasicSerializer
    attributes :title, :description, :popug_guid

    attribute :event_name, -> { 'Tasks.Added' }
    attribute :event_version, -> { 1 }
  end
end
