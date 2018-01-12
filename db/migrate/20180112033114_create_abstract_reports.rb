class CreateAbstractReports < ActiveRecord::Migration[5.1]
  def change
    create_table :abstract_reports do |t|
      t.integer :abstractId
      t.integer :recommendation
      t.integer :innovation
      t.integer :breadth
      t.integer :presentationQuality
      t.boolean :publicContent
      t.string :notes

      t.timestamps
    end
  end
end
