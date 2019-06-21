class AddActive < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :active, :boolean, default: false
  end
end
