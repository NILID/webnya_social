class IconsController < ApplicationController
  load_and_authorize_resource

  def index; end
  def show;  end
  def new;   end
  def edit;  end

  def create

    respond_to do |format|
      if @icon.save
        format.html { redirect_to @icon, notice: 'Icon was successfully created.' }
        format.json { render json: @icon, status: :created, location: @icon }
      else
        format.html { render action: "new" }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_position
    @icon.update_attributes!(xposition: params[:xposition], yposition: params[:yposition])
    render :nothing => true
  end

  def update
    respond_to do |format|
      if @icon.update_attributes(icon_params)
        format.html { redirect_to @icon, notice: 'Icon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @icon.destroy

    respond_to do |format|
      format.html { redirect_to icons_url }
      format.json { head :no_content }
    end
  end

  private

    def icon_params
      params.require(:icon).permit(:title, :url, :xposition, :yposition, :icon)
    end

end
