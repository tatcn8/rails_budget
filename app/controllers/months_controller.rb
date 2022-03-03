class MonthsController < ApplicationController
  def index
    @months = Month.all
  end

  def show
    @month = Month.find(params[:id])
  end

  def new
    @month = Month.new
  end

  def create
    @month = Month.new(month_params)

    if @month.save
      redirect_to @month
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @month = Month.find(params[:id])
  end

  def update
    @month = Month.find(params[:id])

    if @month.update(month_params)
      redirect_to @month
    else
      render :edit, status: :unprocessable_entity
    end
  end
def destroy
    @month = Month.find(params[:id])
    @month.destroy

    redirect_to root_path, status: :see_other
  end
  private
  def month_params
    params.require(:month).permit(:title, :status)
  end
end