class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :doi
      t.string :title
      t.integer :journal_id
      t.integer :vol
      t.integer :year
      t.integer :issue
      t.integer :start_page

      t.timestamps
    end
  end
end
