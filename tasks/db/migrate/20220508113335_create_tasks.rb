class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.float :debit_price
      t.float :credit_price
      t.integer :user_id

      t.timestamps
    end
  end
end
