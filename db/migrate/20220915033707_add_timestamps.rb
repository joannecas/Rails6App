class AddTimestamps < ActiveRecord::Migration[6.0]
  def change
    add_column :birds, :created_at, :datetime
    add_column :birds, :updated_at, :datetime
  end
end
