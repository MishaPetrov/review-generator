class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :campaign_id, :integer
      t.column :length, :integer
      t.column :content, :text
      
      t.timestamps
    end
  end
end
