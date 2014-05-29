class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :title
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
