class AddColumnToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :fee, :string, null: false, default: ""
  end
end
