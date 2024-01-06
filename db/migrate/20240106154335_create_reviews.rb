class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :username
      t.string :email
      t.text :comment
      t.integer :rating
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
