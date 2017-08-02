class AddTitleToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :reply_id, :integer
  end
end
