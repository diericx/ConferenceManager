class FixRevAssColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviewer_assignments, :abstract_id, :submission_id
  end
end
