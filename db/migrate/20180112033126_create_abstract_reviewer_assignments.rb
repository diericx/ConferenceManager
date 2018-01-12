class CreateAbstractReviewerAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :abstract_reviewer_assignments do |t|
      t.integer :abstract_id
      t.integer :user_id

      t.timestamps
    end
  end
end
