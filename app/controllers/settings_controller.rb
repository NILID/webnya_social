class SettingsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :setting, :through => :user, :singleton => :true

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to user_setting_path(@user), notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
end
