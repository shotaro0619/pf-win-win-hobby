class AddLabelToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :label, :string
  end
end
