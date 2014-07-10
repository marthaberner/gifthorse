class ChangeUrlColumnToNullFalse < ActiveRecord::Migration
  def change
    change_column_null :bookmarks, :url, false
  end
end
