json.array!(@media) do |medium|
  json.extract! medium, :title, :runtime, :genre, :platform, :director, :cast, :release_date, :critic_rating, :audience_rating, :language, :summary, :trailer_link, :movie_link
  json.url medium_url(medium, format: :json)
end
