class AddResultsAndFeedbackToResult < ActiveRecord::Migration[5.2]
  def change
    add_column(:results, :results, :string)
    add_column(:results, :feedback, :string)
  end
end
