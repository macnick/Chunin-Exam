class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :shortened

      t.timestamps
    end
  end
end
