class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original
      t.integer :clicks
      t.string :shortened_url
      t.timestamps
    end
  end
end
