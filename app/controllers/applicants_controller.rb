class ApplicantsController < ApplicationController
  respond_to  :html, :js


  def index

    @applicants = Applicant.all
    applicants = Applicant.all


    respond_to do |format|
      format.html
      format.csv { send_data applicants.to_csv }
      format.xls { send_data applicants.to_csv(col_sep: "\t")}
    end
  end

  def new
    @applicant = Applicant.new
  end

  def create

    @applicant = Applicant.create(applicant_params)
    if @applicant.number_of_wrestlers.to_i < 7
      @applicant.fee = (@applicant.number_of_wrestlers.to_i * 40)
      @applicant.save
    elsif @applicant.full_team_entry == 1 && @applicant.number_of_wrestlers
      @applicant.fee = 425
      @applicant.save
    else
      @applicant.fee = 425
      @applicant.save
    end

    respond_to do |format|
      if @applicant.save
        UserMailer.new_applicant(@applicant).deliver
        if @applicant.number_of_wrestlers.to_i < 7
          UserMailer.applicant_confirmation_individual(@applicant).deliver
        else
          UserMailer.applicant_confirmation_team(@applicant).deliver
        end
        format.html { redirect_to root_path, notice: 'application was successfully submitted.' }
         format.json { render action: 'index', status: :created, location: @applicant }
        # added:
        format.js   { render action: 'index', status: :created, location: @applicant }
      else
        format.html { render action: 'new' }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:school, :coach, :address, :city, :state, :zip_code, :school_phone, :email, :best_phone, :full_team_entry, :individual_entry, :number_of_wrestlers, :fee)
  end

end




