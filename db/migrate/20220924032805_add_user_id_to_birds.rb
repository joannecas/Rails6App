class AddUserIdToBirds < ActiveRecord::Migration[6.0]
  def change
    add_column :birds, :user_id, :int 
  end
end
