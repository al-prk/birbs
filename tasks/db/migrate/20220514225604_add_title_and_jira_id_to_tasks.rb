class AddTitleAndJiraIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :jira_id, :string
    add_column :tasks, :popug_guid, :string
  end
end
