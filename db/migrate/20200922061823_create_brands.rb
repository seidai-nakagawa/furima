class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      ## Database authenticatable
      t.string :name,                               null: false
      t.timestamps
    end
  end
end
