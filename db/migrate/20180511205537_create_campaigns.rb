class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.column :type_name, :string
      t.column :user_id, :integer
      t.column :employees, :string
      t.column :specialization, :string

      t.timestamps
    end
  end
end
