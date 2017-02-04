class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.references :user, foreign_key: true
      t.text :topic
      t.text :method
      t.text :category
      t.text :element
      t.text :action
      t.text :tag

      t.timestamps
    end
  end
end
