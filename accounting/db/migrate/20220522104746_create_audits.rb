class CreateAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :audits do |t|
      t.integer :account_id
      t.integer :task_id
      t.integer :delta

      t.timestamps
    end
  end
end
