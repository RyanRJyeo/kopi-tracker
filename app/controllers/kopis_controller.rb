class KopisController < ApplicationController

  before_action :authenticate_user!, :except => [ :index, :show ]


  def index
    @kopi = Kopi.all.order('id')

  end

  def new
    @origins = Origin.all

    @roasts = Roast.all

  end

  def edit

    @kopi = Kopi.find(params[:id])

    @origins = Origin.all

    @roasts = Roast.all

  end

  def create

    @kopi = Kopi.new(kopi_params)

    @kopi.user = current_user

    @kopi.save
    redirect_to @kopi

  end

  def update

    @kopi = Kopi.find(params[:id])

    @kopi.update(kopi_params)
    redirect_to @kopi

  end


  def show
    @kopi = Kopi.find(params[:id])
  end


  def destroy

    @kopi = Kopi.find(params[:id])
    @kopi.destroy

    redirect_to @kopi

  end


private

  def kopi_params
    params.require(:kopi).permit(:name, :roast_id, :origin_id, :price)
  end

end