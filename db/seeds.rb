#quick and dirty
{
    'Bordeaux': "http://medias.lequipe.fr/logo-football/18/300?20161007100454",
    'Lille': "http://medias.lequipe.fr/logo-football/43/300?20161007100454",
    'Paris-SG': "http://medias.lequipe.fr/logo-football/26/300?20161007100454",
    'Toulouse': "http://medias.lequipe.fr/logo-football/12/300?20161007100454",
    'Lyon': "http://medias.lequipe.fr/logo-football/22/300?20161007100454",
    'Saint-Etienne': "http://medias.lequipe.fr/logo-football/38/300?20161007100454",
    'Monaco': "http://medias.lequipe.fr/logo-football/25/300?20161007100454",
    'Bastia': "http://medias.lequipe.fr/logo-football/16/300?20161007100454",
    'Dijon': "http://medias.lequipe.fr/logo-football/202/300?20161007100454"
}.each do |k, v|
  LogoNomenclature.create!(team: k, img: v)
end


teams = %W[Bordeaux Lille Paris-SG Toulouse Lyon Saint-Etienne Monaco Bastia Dijon]

%W[Ligue\ 1 champions\ League].each do |champ|


  # journées
  matches = rand(15..20).times.collect.with_index do |_, i|

    rand(5..15).times.collect do
      home_team = teams.sample
      away_team = teams.sample

      # not lucky today
      loop do
        away_team = teams.sample
        break unless away_team == home_team
      end

      {
          matchday: i,
          home_team: home_team,
          home_prevision: rand.to_f.round(2),
          home_score: i < 5 ? rand(0..5): nil,
          draw_prevision: rand.to_f.round(2),
          away_team: away_team,
          away_prevision: rand.to_f.round(2),
          away_score: i < 5 ? rand(0..5): nil,
      }
    end
  end.flatten

  Championnat.create!(name: champ, matches_attributes: matches)
end

