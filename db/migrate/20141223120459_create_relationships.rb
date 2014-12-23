class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :followed, index: true

      t.timestamps
    end
  end
end
