json.array!(@concepts) do |concept|
  json.extract! concept, :id, :title, :description, :body
  json.url concept_url(concept, format: :json)
end
