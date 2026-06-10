class Api::V1::WineProfilesController < ApplicationController
  def index
    # render json: WineProfile.all
    wine_profiles = WineProfile.includes(wine_profile_taste_parameters: :taste_parameter)
    render json: wine_profiles.map { |wine_profile| WineProfileSerializer.new(wine_profile).as_json }

  end

  def show
    # render json: WineProfile.find_by(slug: params[:id])
    wine_profile = WineProfile.find_by!(slug: params[:id])
    render json: WineProfileSerializer.new(wine_profile).as_json
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
    @wine_profile = WineProfile.find_by!(slug: params[:id])
    if @wine_profile.update(wine_profile_params)
      render json: @wine_profile
    else
      render json: @wine_profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wine_profile = WineProfile.find_by!(slug: params[:id])
    @wine_profile.destroy
    head :no_content
  end

  private

  def wine_profile_params
    params.require(:wine_profile).permit(:name, :color, :grapes, :regions, :notes, :serving, :parameters)
  end
end
