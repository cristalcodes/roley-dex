class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :mailing_address
      t.string :phone
      t.string :birthday
      t.integer :user_id
      t.integer :note_id
    end
  end
end
