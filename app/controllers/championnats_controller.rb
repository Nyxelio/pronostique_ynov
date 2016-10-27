class ChampionnatsController < ApplicationController
  layout 'admin'

  def new
    @championnat = Championnat.new
  end

  def edit
    @championnat = Championnat.find(params[:id])
  end

  def show
    @championnat = Championnat.find(params[:id])
    @matches = @championnat.matches.order(matchday: :desc).paginate(:page => params[:page], per_page: 10)
  end

  def create
    @championnat = Championnat.new(championnat_params)
    if @championnat.save
      redirect_to championnats_path
    else
      render 'new'
    end
  end

  def update
    @championnat = Championnat.new(championnat_params)
    if @championnat.update(championnat_params)
      redirect_to championnats_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  def index
    @championnats = Championnat.all
  end

  private
  def championnat_params
    params.require(:championnat).permit(:name)
  end
end
