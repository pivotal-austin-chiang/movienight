
class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  require 'net/http'
  require 'json'
  @@key="vxwjzfe4gaczt2qpurr33cyj"

  # GET /movies
  # GET /movies.json
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



  def index
    @movies = Movie.all
    @box_office = JSON.parse(parseData('http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=16&country=us&apikey=vxwjzfe4gaczt2qpurr33cyj'))["movies"]

    @in_theaters = JSON.parse(parseData('http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?page_limit=16&page=1&country=us&apikey=vxwjzfe4gaczt2qpurr33cyj'))["movies"]

    @open_movies = JSON.parse(parseData('http://api.rottentomatoes.com/api/public/v1.0/lists/movies/opening.json?limit=16&country=us&apikey=vxwjzfe4gaczt2qpurr33cyj'))["movies"]
    @total = Array.new
    @total<<@box_office
    @total<<@in_theaters
    @total<<@open_movies
    @table_title = Array.new
    @table_title<<"Box Office"<<"In Theaters"<<"Opening Movies"
    # search    = params[:search_query]
    # @page = 1
    # @page_limit = 10
    # @search_movies = JSON.parse(parseData('http://api.rottentomatoes.com/api/public/v1.0/movies.json?q='search'&page_limit='+@page_limit'&page='+@page'&apikey=vxwjzfe4gaczt2qpurr33cyj'))["movies"]


  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :mpaa, :a_rating, :a_score, :c_score, :image, :synopsis)
    end
end
