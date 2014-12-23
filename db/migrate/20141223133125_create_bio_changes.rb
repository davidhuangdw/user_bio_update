class CreateBioChanges < ActiveRecord::Migration
  def change
    create_table :bio_changes do |t|
      t.belongs_to :user, index: true
      t.string :content

      t.timestamps
    end
  end
end
