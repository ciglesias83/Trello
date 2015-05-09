class AddMemberUsernameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :member_username, :string
  end
end
