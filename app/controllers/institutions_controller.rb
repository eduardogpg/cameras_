class InstitutionsController < ApplicationController	

	before_action :set_institution, only: [:show]
    
  def index
    @institutions = Institution.all.order('name ASC')
  end

  def show
    @institutions = Institution.all
  end


	private
	
	def set_institution
		@institution = Institution.find(params[:id])
	end

end
