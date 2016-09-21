class DateIdeasController < ApplicationController
  before_action :set_date_idea, only: [:show, :edit, :update, :destroy]

  # GET /date_ideas
  # GET /date_ideas.json
  def index
    @date_ideas = DateIdea.all
  end

  # GET /date_ideas/1
  # GET /date_ideas/1.json
  def show
  end

  # GET /date_ideas/new
  def new
    @date_idea = DateIdea.new
  end

  # GET /date_ideas/1/edit
  def edit
  end

  def search
     parameters = { term: params[:term], limit: 16 }
    render json: Yelp.client.search('San Francisco')
  end

  # POST /date_ideas
  # POST /date_ideas.json
  def create
    @date_idea = DateIdea.new(date_idea_params)

    respond_to do |format|
      if @date_idea.save
        format.html { redirect_to @date_idea, notice: 'Date idea was successfully created.' }
        format.json { render :show, status: :created, location: @date_idea }
      else
        format.html { render :new }
        format.json { render json: @date_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_ideas/1
  # PATCH/PUT /date_ideas/1.json
  def update
    respond_to do |format|
      if @date_idea.update(date_idea_params)
        format.html { redirect_to @date_idea, notice: 'Date idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_idea }
      else
        format.html { render :edit }
        format.json { render json: @date_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_ideas/1
  # DELETE /date_ideas/1.json
  def destroy
    @date_idea.destroy
    respond_to do |format|
      format.html { redirect_to date_ideas_url, notice: 'Date idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_idea
      @date_idea = DateIdea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_idea_params
      params.fetch(:date_idea).permit(:name)
    end
end
