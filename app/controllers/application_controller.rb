class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_catalogs

  def current_ability
    @current_ability ||= current_admin ? AdminAbility.new(current_admin) : UserAbility.new(current_user)
  end

  private
    def set_catalogs
      @catalogs = Catalog.all
    end
end
