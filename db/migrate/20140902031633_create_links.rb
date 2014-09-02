class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :short_link
      t.string :original_link

      t.timestamps
    end
  end
end
