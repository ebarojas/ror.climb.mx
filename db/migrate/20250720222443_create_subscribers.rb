class CreateSubscribers < ActiveRecord::Migration[8.0]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false
      t.string :name, null: false, limit: 100
      t.text :about, limit: 280
      t.boolean :verified, null: false, default: false

      t.timestamps
    end
    
    add_index :subscribers, :email
  end
end
