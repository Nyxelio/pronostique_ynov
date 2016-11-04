require 'csv'
datas = Rails.root.join('lib','r_engine', 'datas')

matches = []
matchday = 0

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


Dir.glob(datas.join('**')) do |year|
  datas = CSV.read(year, headers: true)

  matches << datas.collect.with_index do |row, i|

    matchday = matchday + 1 if i%10 == 0

    next if row[1].nil?

    {
        matchday: matchday,
        year: Pathname(year).basename.to_s[0..3],
        home_team: row[2],
        home_prevision: nil,
        home_score: row[4],
        draw_prevision: nil,
        away_team: row[3],
        away_prevision: nil,
        away_score: row[4],
    }
  end
  matchday = 0
end

c = Championnat.create!(name: 'Ligue 1', matches_attributes: matches.flatten.compact)

PredictionsJob.new.perform(championship: c)
