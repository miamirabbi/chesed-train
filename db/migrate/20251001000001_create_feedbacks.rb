class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.string :category, null: false, default: 'feedback'
      t.string :name
      t.string :email
      t.text :message, null: false
      t.string :page_url
      t.references :user, foreign_key: true, null: true

      t.timestamps
    end
    add_index :feedbacks, :category
    add_index :feedbacks, :created_at
  end
end
