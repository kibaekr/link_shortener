json.array!(@links) do |link|
  json.extract! link, :id, :short_link, :original_link
  json.url link_url(link, format: :json)
end
