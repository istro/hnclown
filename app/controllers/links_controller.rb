class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    # all = Link.all
    # warn 'new link:'
    # warn @link.inspect
    # warn 'all links:'
    # warn all
    if @link.save
      redirect_to links_path
    else
      redirect_to new_link_path
    end
  end

  def show
    @link = Link.find_by_url(params[:url])
    redirect_to "http://#{@link.url}"
  end
end
