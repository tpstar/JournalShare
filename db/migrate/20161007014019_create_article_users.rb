class CreateArticleUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :article_authors do |t|
      t.integer :article_id
      t.integer :author_id

      t.timestamps
    end
  end
end
