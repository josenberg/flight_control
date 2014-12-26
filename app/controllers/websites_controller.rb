class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(website_params)
    respond_to do |format|
      if @website.save
        format.html { redirect_to @website, notice: 'website was successfully created.' }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @website.update(website_params)
      redirect_to @website,
      notice: 'Website was successfully updated.'
    else
      render :edit
    end
  end

  def index
    @websites = Website.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = Website.find(params[:id])
    end

  def website_params
    params.require(:website).permit(:url, :description,
                                                         :search_place, :content)
  end

end
