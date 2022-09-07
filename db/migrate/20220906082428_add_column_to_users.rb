# frozen_string_literal: true

# AddColumnToUsers
class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :phone_number, :string
  end
end
