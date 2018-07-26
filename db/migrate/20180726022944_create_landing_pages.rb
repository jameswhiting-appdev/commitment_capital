class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :email
      t.boolean :answer
      t.integer :question_num

      t.timestamps

    end
  end
end
