class CreateAbstractProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :abstract_proposals do |t|
      t.string :title
      t.string :url
      t.integer :conference_id

      t.timestamps
    end
  end
end
