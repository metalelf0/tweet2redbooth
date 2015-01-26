class CreateClientControlEvents < ActiveRecord::Migration
  def change
    create_table :client_control_events do |t|
      t.integer :user_id
      t.string :command

      t.timestamps null: false
    end
  end
end
