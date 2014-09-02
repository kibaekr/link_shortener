class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @link = Link.new 
  end

  def show 
    redirect_to @link.original_link 
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_url, notice: "Link was successfully created. #{@link.original_link} shortened to #{@link.short_link}" }
        # format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_link
      @link = Link.find_by(short_link: params[:shortened_hash])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:short_link, :original_link)
    end
end
