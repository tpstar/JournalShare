class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.integer :author_id
      t.integer :reader_id
      t.integer :article_id

      t.timestamps
    end
  end
end
