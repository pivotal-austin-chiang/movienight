json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :mpaa, :a_rating, :a_score, :c_score, :image, :synopsis
  json.url movie_url(movie, format: :json)
end
