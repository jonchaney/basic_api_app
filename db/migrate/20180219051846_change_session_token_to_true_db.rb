class ChangeSessionTokenToTrueDb < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :session_token, true
  end
end
