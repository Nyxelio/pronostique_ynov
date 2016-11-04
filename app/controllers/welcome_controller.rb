class WelcomeController < ApplicationController
  def index
    @championnat = Championnat.last

    # Display only current year on welcome page
    current_year = @championnat.matches.select(:year).order(year: :desc).first.year

    # Go to last page
    unless params[:page]
      params[:page] = @championnat.matches.where(year: current_year).count / 10
    end

    @matches = @championnat.matches.where(year: current_year)
                   .order(matchday: :asc).paginate(:page => params[:page], per_page: 10)

  end


  def predict
    PredictionsJob.perform_async(championship: Championnat.first)

    head 200
  end

end
