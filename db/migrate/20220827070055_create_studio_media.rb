class CreateStudioMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :studio_media do |t|
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
