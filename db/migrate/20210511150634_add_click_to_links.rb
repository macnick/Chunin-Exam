class AddClickToLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :clicked, :integer
  end
end
