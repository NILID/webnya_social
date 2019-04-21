class SettingsController < ApplicationController
  load_and_authorize_resource :user,  :find_by => :slug
  load_and_authorize_resource :setting, :through => :user, :singleton => :true

  def index
  end

  def show
  end

  def new
  end

  def edit
    @icon_color = @setting.icon_color !=nil ? @setting.icon_color : '#ffffff'
  end

  def create
  end

  def update
    respond_to do |format|
      if @setting.update_attributes(setting_params)
        format.html { redirect_to user_setting_path(@user), notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def setting_params
      params.require(:setting).permit(:bg, :icon_color, :icon_size)
    end

end
