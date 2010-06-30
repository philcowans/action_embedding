class PageletsController < ApplicationController
  def show
    @pagelet_id = params[:id]
  end
end
