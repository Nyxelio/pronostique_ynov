class REngine

  class << self

    def predictions
      s = []
      s << "setwd('#{::REngine.datas.to_s}')"
      s << File.read(REngine.scripts.join('predictions.R'))
      s.join.to_s
    end

    def root
      Rails.root.join('lib', 'r_engine')
    end

    def datas
      REngine.root.join('datas')
    end

    def scripts
      REngine.root.join('scripts')
    end
  end

end