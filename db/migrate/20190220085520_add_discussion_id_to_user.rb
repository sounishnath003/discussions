class AddDiscussionIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :discussion_id, :integer
  end
end
