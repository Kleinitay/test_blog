class AddPostIdToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :post_id, :integer
  end
end
