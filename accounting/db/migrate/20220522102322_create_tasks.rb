class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :jira_id
      t.float :debit_price
      t.float :credit_price
      t.string :status
      t.string :title

      t.timestamps
    end
  end
end
