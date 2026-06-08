class Api::V1::TasteParametersController < ApplicationController
  def index
    render json: TasteParameter.all
  end

  def show
    render json: TasteParameter.find(params[:id])
  end

  def create
    @taste_parameter = TasteParameter.new(taste_parameter_params)
    if @taste_parameter.save
      render json: @taste_parameter, status: :created
    else
      render json: @taste_parameter.errors, status: :unprocessable_entity
    end
  end

  def update
    @taste_parameter = TasteParameter.find(params[:id])
    if @taste_parameter.update(taste_parameter_params)
      render json: @taste_parameter
    else
      render json: @taste_parameter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @taste_parameter = TasteParameter.find(params[:id])
    @taste_parameter.destroy
    head :no_content
  end

  private

  def taste_parameter_params
    params.require(:taste_parameter).permit(:id, :label, :low, :high, :help)
  end
end