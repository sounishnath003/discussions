class AddContentToDiscussions < ActiveRecord::Migration[6.0]
  def change
    add_column :discussions, :content, :text
  end
end
