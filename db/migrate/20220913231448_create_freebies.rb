class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
    create_table :freebies do |t| 
      t.string :item_name
      t.integer :value
      # NOTE: This possibly needs t.string :dev_name
      # First attempt
      # t.string :dev_name

      # Second attempt:
      t.integer :company_id
      t.integer :dev_id
    end
  end
end
