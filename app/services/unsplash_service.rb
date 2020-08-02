class UnsplashService
  def get_background_url(keyword)
    search_query = keyword.gsub(",", "+")

    response = conn.get("/search/photos") do |req|
      req.params['page'] = 1
      req.params['query'] = search_query
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |req|
      req.headers['Accept-Version'] = 'v1'
      req.params['client_id'] = ENV['UNSPLASH_KEY']
    end
  end
end
