class CatalogsController < ApplicationController
  def index
  end

  def show
    @catalog = Catalog.friendly.find(params[:id])
  end
end
