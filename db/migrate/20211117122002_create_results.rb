class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :user_profile_id
      t.integer :product_id
      t.text :results
      t.text :feedback
    end
  end
end
