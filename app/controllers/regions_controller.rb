class RegionsController < ApplicationController	

    before_action :set_region, only: [:show]
    
    def index
        @regions = Region.all.order('name ASC')
    end

    def show
        @Region = Region.all
    end

    private
    
    def set_region
        @region = Region.find(params[:id])
    end
end
