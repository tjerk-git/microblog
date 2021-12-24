json.extract! newsletter, :id, :title, :body, :slug, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)
