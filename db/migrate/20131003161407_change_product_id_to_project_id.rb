class ChangeProductIdToProjectId < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.rename :product_id, :project_id
    end
  end
end
