class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column :categories, :name,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :categories, :name,:string, null: false
  end
end
