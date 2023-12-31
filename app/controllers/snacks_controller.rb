class SnacksController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index, :show ]
before_action :set_snack, only: [:show, :edit, :update, :destroy]

  def index
    @snacks = Snack.all
    if params[:query].present?
      sql_subquery = <<~SQL
      snacks.name @@ :query
      OR snacks.description @@ :query
      OR users.username @@ :query
      SQL
    @snacks = @snacks.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @booking = Booking.new
    @markers =
      [{
        lat: @snack.latitude,
        lng: @snack.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { snack: @snack }),
        marker_html: render_to_string(partial: "marker", locals: { snack: @snack })
      }]
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

  def update
    if @snack.update(snack_params)
      redirect_to snack_path(@snack)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @snack.destroy
    redirect_to snacks_path, status: :see_other
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end

  def snack_params
    params.require(:snack).permit(:name, :description, :price, :photo, :address)
  end
end
