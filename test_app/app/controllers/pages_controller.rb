class PagesController < ApplicationController
  def show
    @page_id = params[:id]
  end
end
