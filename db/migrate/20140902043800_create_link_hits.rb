class CreateLinkHits < ActiveRecord::Migration
  def change
    create_table :link_hits do |t|
      t.string :ip_address
      t.integer :link_id

      t.timestamps
    end
  end
end
