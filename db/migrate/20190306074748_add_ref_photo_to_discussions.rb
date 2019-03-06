class AddRefPhotoToDiscussions < ActiveRecord::Migration[6.0]
  def change
    add_column :discussions, :ref_photo, :string
  end
end
