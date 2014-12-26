class AddCollumsToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :search_place, :string
    add_column :websites, :content, :string
  end
end
