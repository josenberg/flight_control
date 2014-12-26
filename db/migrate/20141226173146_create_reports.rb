class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :id_website
      t.string :status

      t.timestamps null: false
    end
  end
end
