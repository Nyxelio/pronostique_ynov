class Match < ApplicationRecord
  belongs_to :championnat, inverse_of: :matches
  validates_presence_of :championnat

  def winner
    home_score >= away_score ? home_team : away_team unless home_score.nil? or away_score.nil?
  end
end
