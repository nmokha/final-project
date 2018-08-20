class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.integer :decision_id
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
