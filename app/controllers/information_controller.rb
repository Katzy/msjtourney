class InformationController < ApplicationController
  def about
  end

  def teams_entered
    @users = User.order('name ASC')
  end

  def entry_information
  end

  def schedule
  end

  def map_to_msj
  end

  def place_winners_2014
  end

  def hotels
  end

  def results_prior_years
  end

  def champions_1990_to_2013
  end

  def brackets
  end

  def team_scores
  end

  def weight_106
  end

  def weight_113
  end

  def weight_120
  end

  def weight_126
  end

  def weight_132
  end

  def weight_138
  end

  def weight_145
  end

  def weight_152
  end

  def weight_160
  end

  def weight_170
  end

  def weight_182
  end

  def weight_195
  end

  def weight_220
  end

  def weight_285
  end
end
