class CreateLogoNomenclature < ActiveRecord::Migration[5.0]
  def change
    create_table :logo_nomenclatures do |t|
      t.string :team, null: false
      t.string :img
    end
  end
end
