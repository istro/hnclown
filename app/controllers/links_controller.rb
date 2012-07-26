class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    warn 'here are me params before creating the link'
    warn params.inspect
    Link.create(params[:link])
    redirect_to "/links"
  end

  def show
    @link = Link.find_by_url(params[:url])
    redirect_to "http://#{@link.url}"
  end

end
