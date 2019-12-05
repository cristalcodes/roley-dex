class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :date
      t.text :content
      t.integer :contact_id
    end
  end
end
