class AddUserReferenceToConcepts < ActiveRecord::Migration
  def change
  	add_index :concepts, :user_id
  end
end
