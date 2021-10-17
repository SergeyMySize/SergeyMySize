class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :email
      t.float :height
      t.float :weight
      t.string :gender
      t.string :bra_size
      t.string :fullest_part
    end
  end
end
