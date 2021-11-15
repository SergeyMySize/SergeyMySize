class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :logo
      t.string :size_chart_code
      t.string :gender
      t.timestamps
    end
  end
end

