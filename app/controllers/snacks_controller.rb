class SnacksController < ApplicationController
before_action :set_snack, only: [:show, :edit]

  def index
    @snacks = Snack.all;
  end

  def show
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = Snack.new(snack_params)
    # user_id = current_user.id
    # @snack.user_id = user_id
    @snack.user = current_user
    if @snack.save
      redirect_to snacks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end

  def snack_params
    params.require(:snack).permit(:name, :description, :price)
  end
end
