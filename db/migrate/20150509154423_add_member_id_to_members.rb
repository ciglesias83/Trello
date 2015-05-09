class AddMemberIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :member_id, :integer
  end
end
