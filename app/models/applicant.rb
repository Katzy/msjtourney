class Applicant < ActiveRecord::Base


  validates :school, presence: true, null: false
  validates :coach, presence: true, null: false
  validates :city, presence: true, null: false
  validates :state, presence: true, null: false
  validates :best_phone, presence: true, null: false
  validates :email, presence: true, null: false
  validates :number_of_wrestlers, presence: true, null: false
  validates_uniqueness_of :email


  def self.to_csv(options = {})
    x = ""
    y = ""
    CSV.generate(options) do |csv|
      csv << ["school", "Coach name", "City", "State", "Phone", "Email", "Full Team", "Individual Entries", "# of Wrestlers", "Fee" ]
      all.each do |applicant|
        applicant.full_team_entry == true ? x = "Yes" : x = "No"
        applicant.individual_entry == true ? y = "Yes" : y = "No"
        csv << [applicant.school, applicant.coach, applicant.city, applicant.state, applicant.best_phone, applicant.email, x, y, applicant.number_of_wrestlers, applicant.fee]
      end
    end
  end


end

