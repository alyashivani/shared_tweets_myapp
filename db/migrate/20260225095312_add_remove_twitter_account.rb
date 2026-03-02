class AddRemoveTwitterAccount < ActiveRecord::Migration[8.1]
  def change
    add_column :twitter_accounts, :refresh_token, :string
    add_column :twitter_accounts, :expires_at, :string
    remove_column :twitter_accounts, :secret, :string
  end
end
