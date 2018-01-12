json.extract! conference, :id, :name, :year, :created_at, :updated_at
json.url conference_url(conference, format: :json)
