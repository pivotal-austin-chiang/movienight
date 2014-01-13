class SearchController < ApplicationController
  def parseData (uri)
    uri = URI.parse(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    office = response.body
    if response.header["Content-Encoding"] == "gzip"
      gz = Zlib::GzipReader.new(StringIO.new(office.to_s))    
      office = gz.read
    end
    office
  end

  def query
  	@query = params[:query]
  	@page_no = params[:page_no]
  	if !@page_no
  		@page_no='1'
  	end
  	@movies = Movie.all
  	total_json = JSON.parse(parseData('http://api.rottentomatoes.com/api/public/v1.0/movies.json?q='+@query+'&page_limit=10&page='+@page_no+'&apikey=vxwjzfe4gaczt2qpurr33cyj'))
    @movie_search = total_json["movies"]
    @total_titles = total_json["total"]
    # @total_pages = total.to_i/10 +1

  end
end
