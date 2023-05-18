class AddColumnsCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published_on , :datetime
  end
end
