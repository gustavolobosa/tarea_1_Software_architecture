class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :score
      t.integer :number_of_up_votes
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
