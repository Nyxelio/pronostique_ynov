class AddYearIdToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :year, :integer
  end
end
