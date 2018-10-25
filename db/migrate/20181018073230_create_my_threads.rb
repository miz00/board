class CreateMyThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :my_threads do |t|
      t.string :title

      t.timestamps
    end
  end
end
