class AddFieldsIdToAbstractProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :abstract_proposals, :contact_name, :string
    add_column :abstract_proposals, :contact_email, :string
    add_column :abstract_proposals, :organization, :string
    add_column :abstract_proposals, :proposed_format, :string
  end
end
