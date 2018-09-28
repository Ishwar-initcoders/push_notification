class CreateCreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :create_notifications do |t|
      t.string :endpoint, unique: true
      t.string :p256dh, unique: true
      t.string :auth, unique: true

      t.timestamps
    end
  end
end
