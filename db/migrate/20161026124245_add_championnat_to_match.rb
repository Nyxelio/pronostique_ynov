class AddChampionnatToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :championnat_id, :integer
  end
end
