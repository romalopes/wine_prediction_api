class Api::V1::WinesController < ApplicationController
  def index
    render json: Wine.all
  end

  def show
    render json: Wine.find(params[:id])
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      render json: @wine, status: :created
    else
      render json: @wine.errors, status: :unprocessable_entity
    end
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      render json: @wine
    else
      render json: @wine.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    head :no_content
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :region, :color, :prompt)
  end
end