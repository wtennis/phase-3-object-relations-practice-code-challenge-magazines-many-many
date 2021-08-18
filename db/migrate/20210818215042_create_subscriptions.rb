class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :price
      t.belongs_to :magazine, foreign_key: true
      t.belongs_to :reader, foreign_key: true
    end
  end
end
