class MainController < ApplicationController
  load_and_authorize_resource :user,  :find_by => :slug

  def index
    @icons=Icon.all
  end
end
