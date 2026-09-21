class SetDefaultRoleOnUsers < ActiveRecord::Migration[8.1]
  def up
    change_column_default :users, :role, from: nil, to: "reader"
    User.where(role: nil).update_all(role: "reader")
    change_column_null :users, :role, false
  end

  def down
    change_column_null :users, :role, true
    change_column_default :users, :role, from: "reader", to: nil
  end
end
