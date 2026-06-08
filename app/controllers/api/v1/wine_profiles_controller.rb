class Api::V1::WineProfilesController < ApplicationController
  def index
    render json: WineProfile.all
  end

  def show
    render json: WineProfile.find(params[:id])
  end

  def create
    @wine_profile = WineProfile.new(wine_profile_params)
    if @wine_profile.save
      render json: @wine_profile, status: :created
    else
      render json: @wine_profile.errors, status: :unprocessable_entity
    end
  end

  def update
    @wine_profile = WineProfile.find(params[:id])
    if @wine_profile.update(wine_profile_params)
      render json: @wine_profile
    else
      render json: @wine_profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wine_profile = WineProfile.find(params[:id])
    @wine_profile.destroy
    head :no_content
  end

  private

  def wine_profile_params
    params.require(:wine_profile).permit(:name, :color, :grapes, :regions, :notes, :serving, :parameters)
  end
end