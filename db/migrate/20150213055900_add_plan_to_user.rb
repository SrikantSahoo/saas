class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column  :users, :pln_id, :integer
  end
end
