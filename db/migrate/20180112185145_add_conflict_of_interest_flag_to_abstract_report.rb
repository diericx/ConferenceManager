class AddConflictOfInterestFlagToAbstractReport < ActiveRecord::Migration[5.1]
  def change
    add_column :abstract_reports, :conflictOfInterest, :boolean
  end
end
