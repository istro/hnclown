class LinksController < ApplicationController
  def index
    @links = Link.order('created_at DESC')
  end

  def new
    @link = Link.new
  end

  def create
    Link.create(params[:link])
    redirect_to links_path
  end

  def show
    @link = Link.find_by_id(params[:id])
    redirect_to links_path
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.user_id != current_user.id || @link.created_at + 900 < Time.now
      redirect_to links_path
    else
      warn 'here are params'
      warn params[:link]
      @link.update_attributes(params[:link])
      flash.now[:notice] = "Link was updated."
      render 'edit'
    end
  end

end
