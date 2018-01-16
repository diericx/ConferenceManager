class RenameTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :abstract_proposals, :submissions
    rename_table :abstract_reports, :submission_reviews
    rename_table :abstract_reviewer_assignments, :reviewer_assignments
  end
end
