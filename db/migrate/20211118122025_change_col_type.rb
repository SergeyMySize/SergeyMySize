class ChangeColType < ActiveRecord::Migration[5.2]
  def change
    remove_column(:results, :results, :string)
    remove_column(:results, :feedback, :string)
  end
end
