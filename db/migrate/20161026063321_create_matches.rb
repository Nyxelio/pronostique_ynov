class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :matchday
      t.string :home_team
      t.float :home_prevision # prévision score domicile
      t.integer :home_score
      t.float :draw_prevision # prévision match nul
      t.string :away_team
      t.float :away_prevision # prévision score extérieur
      t.integer :away_score
      t.timestamps null: false
      t.timestamps
    end
  end
end
