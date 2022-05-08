class InstitutionsController < ApplicationController	

	before_action :set_institution, only: [:show]
    
  def index
    @institutions = Institution.all
  end

  def show
  end


	private
	
	def set_institution
		@institution = Institution.find(params[:id])
	end

end
