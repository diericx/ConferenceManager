class AddReviewerIdToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :abstract_reports, :reviewerId, :integer
  end
end
