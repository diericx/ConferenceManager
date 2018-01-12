json.extract! abstract_proposal, :id, :title, :url, :created_at, :updated_at
json.url abstract_proposal_url(abstract_proposal, format: :json)
