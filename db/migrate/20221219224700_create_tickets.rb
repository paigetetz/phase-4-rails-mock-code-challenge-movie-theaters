class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.integer :guest_id
      t.integer :theater_id

      t.timestamps
    end
  end
end
