class PageletsController < ApplicationController
  def show
    @pagelet_id = params[:id]
    redirect_to "/pagelets/three" and return if @pagelet_id == "redirect"
  end
end
