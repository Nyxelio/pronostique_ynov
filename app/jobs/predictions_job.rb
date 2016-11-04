class PredictionsJob
  include SuckerPunch::Job
  workers 2

  def perform(*args)

    options = args.extract_options!

    championship = options[:championship]

    ActiveRecord::Base.connection_pool.with_connection do
      result = Rserve::Connection.new.eval(::REngine.predictions).to_ruby

      unless result.empty?

        count = championship.matches.order(year: :desc, matchday: :desc).first.matchday + 1

        if championship
          (0..9).each do |i|
            attrs = {
                year: championship.matches.order(year: :desc).first.year,
                home_team: result[0][i],
                home_prevision: result[2][i],
                home_score: nil,
                draw_prevision: result[3][i],
                away_team: result[1][i],
                away_prevision: result[4][i],
                away_score: nil,
                championnat: championship
            }


            # pour éviter les doublons si le match existe déjà
            m = Match.find_or_initialize_by(attrs)
            m.matchday = count
            m.save!
          end
        end

      end
    end
  end

end