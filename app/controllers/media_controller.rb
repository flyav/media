class MediaController < ApplicationController
  include RottenTomatoes
  
  before_action :set_medium, only: [:show, :edit, :update, :destroy]


  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
    respond_to do |format|
      format.html
      format.csv { send_data @media.to_csv }
    end
  end

  # GET /media/1
  # GET /media/1.json
  def show
  end

  def add
    Rotten.api_key = "g5dzadjs35ee5aagrvm84ezy" 
    @medium = Medium.new
  end
  
  def select
    @medium = Medium.new(medium_params)
    @selections = RottenMovie.find(:title => @medium.title).collect {|s| [s.title, s.id.to_i] }
    if @selections.blank?
      redirect_to(:action => 'new', :title => @medium.title) 
    end 
  end
     
  # GET /media/new -changed (medium_params
  def new
    if params[:medium].present?
      @medium = Medium.new(medium_params)
      @rotten = RottenMovie.find(:id => @medium.rotten_id)
    else @medium = Medium.new
      @medium.title = params['title']
    end
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(medium_params)
    
    respond_to do |format|
      if @medium.save
        format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medium }
      else
        format.html { render action: 'new' }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url }
      format.json { head :no_content }
    end
  end
  
  def queue
    #netflix style list of unowned and unwatched movies
    @media = Medium.watched(false).own(false)
  end

  def unwatched
    #list of unwatched owned movies
    @media = Medium.watched(false).own(true)
  end

  def view
    # Look at the all owned in pretty format
    @media = Medium.own(true)
  end
  
  def watch
    # watch the media
  end
  
  def list
    # create a CRUD list and then use the index for a pretty view
    @media = Medium.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
     @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:title, :runtime, :genre, :platform, :director, :cast, :release_date, :critic_rating, :audience_rating, :foreign, :summary, :trailer_link, :movie_link, :rotten_id, :poster_link, :watched, :hassan_rating, :own)
    end
end
