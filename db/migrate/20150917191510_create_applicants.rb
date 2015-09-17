class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :school
      t.string :coach
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :school_phone
      t.string :email
      t.string :best_phone
      t.boolean :full_team_entry, :default => false
      t.boolean :individual_entry, :default => false
      t.string :number_of_wrestlers
    end
  end
end

