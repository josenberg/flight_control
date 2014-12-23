class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.text :description

      t.timestamps null: false
    end
  end
end
