class WebsitesController < ApplicationController
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

  def index
    @websites = Website.all
  end

  private

  def website_params
    params.require(:website).permit(:url, :description)
  end

end
