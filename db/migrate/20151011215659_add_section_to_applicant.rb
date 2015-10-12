class AddSectionToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :section, :string
  end
end
