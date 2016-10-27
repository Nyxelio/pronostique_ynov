class MatchesController < ApplicationController
  layout 'admin'

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.new(match_params)
    if @match.update(match_params)
      redirect_to matches_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  def index
    @matches = Match.all
  end

  private
  def match_params
    params.require(:match).permit!
  end

end
