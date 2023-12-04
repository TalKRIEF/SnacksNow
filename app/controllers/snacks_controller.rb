class SnacksController < ApplicationController
before_action :set_snack, only: [:show]

  def index
    @snacks = Snack.all;
  end

  def show
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end
end
