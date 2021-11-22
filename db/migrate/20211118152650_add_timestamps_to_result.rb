class AddTimestampsToResult < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :results, null: true
  end
end
