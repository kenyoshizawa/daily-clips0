class AddUrlToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :youtube_url, :string
  end
end
