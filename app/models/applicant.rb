class Applicant < ActiveRecord::Base


  validates :school, presence: true, null: false
  validates :coach, presence: true, null: false
  validates :city, presence: true, null: false
  validates :state, presence: true, null: false
  validates :best_phone, presence: true, null: false
  validates :email, presence: true, null: false
  validates :number_of_wrestlers, presence: true, null: false


  def self.to_csv(options = {})
    x = ""
    y = ""
    CSV.generate(options) do |csv|
      csv << ["school", "Coach name", "Address", "City", "State", "School Phone #", "Best Phone #" ]
      all.each do |applicant|
        applicant.full_team_entry == 1 ? x = "Yes" : x = "No"
        applicant.individual_entry == 1 ? y = "Yes" : y = "No"
        csv << [applicant.school, applicant.coach, applicant.address, applicant.city, applicant.state, applicant.zip_code, applicant.school_phone, applicant.best_phone, applicant.email, x, y, applicant.number_of_wrestlers]
      end
    end
  end
end
