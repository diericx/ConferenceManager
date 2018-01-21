class AddFinalDecisionToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :submission_reviews, :final, :boolean, :default => false
  end
end
