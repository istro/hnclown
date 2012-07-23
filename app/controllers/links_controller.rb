class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(params[:link])
    redirect_to links_path

  end

  def show
    @link = Link.find_by_url(params[:url])
    redirect_to "http://#{@link.url}"
  end
end
