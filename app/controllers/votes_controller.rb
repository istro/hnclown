class VotesController < ApplicationController

  def create
    Vote.find_or_create_by_user_id_and_content_id_and_content_type(params[:vote])
    redirect_to links_path
  end
end
