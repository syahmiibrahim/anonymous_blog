class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title,  null: false
      t.string :post_body,  null: false

      t.timestamps null: false
    end
  end
end
