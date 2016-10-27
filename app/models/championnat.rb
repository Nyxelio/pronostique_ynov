class Championnat < ApplicationRecord
  has_many :matches, inverse_of: :championnat
  accepts_nested_attributes_for :matches, allow_destroy: true

  class << self
    def distribution
      Championnat.all.collect do |champ|
        {
            name: champ.name,
            y: champ.matches.count
        }
      end
    end
  end

  def winners_distribution
    distrib = {}

    matches.each do |match|
      next if match.home_score.nil? or match.away_score.nil?
      # to count all teams
      distrib[match.home_team] ||= 0
      distrib[match.away_team] ||= 0
      distrib[match.winner] = distrib[match.winner] + 1
    end.compact

    # sort with winner first
    distrib = distrib.sort_by  {|_key, value| -value}.to_h


    {categories: distrib.keys, series: [name: 'nbre de Victoires', data: distrib.values]}
  end

end
