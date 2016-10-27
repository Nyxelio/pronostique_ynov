class WelcomeController < ApplicationController
  def index
    @championnat = Championnat.first
    @matches = @championnat.matches.order(matchday: :desc).paginate(:page => params[:page], per_page: 10)
  end
end
