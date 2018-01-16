class FixColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :submission_reviews, :abstractId, :submission_id
    rename_column :submission_reviews, :presentationQuality, :presentation_quality
    rename_column :submission_reviews, :publicContent, :public_content
    rename_column :submission_reviews, :reviewerId, :reviewer_id
    rename_column :submission_reviews, :conflictOfInterest, :conflict_of_interest
  end
end
