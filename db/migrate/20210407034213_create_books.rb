class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string        :title, null: false
      t.string        :author
      t.string        :publishing_company
      t.string        :explanation, null: false
      t.references    :user, foreign_key: true
      t.timestamps

    end
  end
end
