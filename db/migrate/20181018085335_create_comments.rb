class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :my_thread, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
