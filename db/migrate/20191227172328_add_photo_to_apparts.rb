class AddPhotoToApparts < ActiveRecord::Migration[6.0]
  def change
    add_column :apparts, :photo, :string
  end
end
