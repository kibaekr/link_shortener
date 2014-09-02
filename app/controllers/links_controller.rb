class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy, :redirect_to_original_link]

  def home_page
    @link = Link.new 
  end

  def index
    @links = Link.all.includes(:link_hits)
  end

  def show
    @link
    @link_hits = @link.link_hits
  end

  def redirect_to_original_link
    @link.link_hits.create(ip_address: current_ip)
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
