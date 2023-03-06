class AddStatusToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :status, :string, default: 'active', null: false
  end
end