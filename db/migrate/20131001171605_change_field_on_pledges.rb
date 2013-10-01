class ChangeFieldOnPledges < ActiveRecord::Migration
  def change
    change_table :pledges do |t|
      t.rename :project, :project_id
    end
  end
end
