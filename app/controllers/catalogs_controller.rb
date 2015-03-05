class CatalogsController < ApplicationController
  def index
  end

  def show
    @catalog = Catalog.find(params[:id])
  end

  private
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end
end
