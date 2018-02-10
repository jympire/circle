class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :gym, foreign_key: true

      t.timestamps
    end
  end
end
