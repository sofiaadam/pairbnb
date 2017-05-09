class HomesController < ApplicationController


    def index
        flash[:notice]
      
    #     @listings = Listing.min_max_price(params[:min], params[:max])
    #    respond_to do |format|
    #        format.js
    #     end
        
		# @listings = Listing.page params[:page]
    end

    def search
       @num_bathroom = Listing.bathroom(params[:bathroom])
       @listings = Listing.min_max_price(params[:min], params[:max])
       respond_to do |format|
           format.js
    end
end

    
    

    # def search
    #    @num_bathroom = Listing.bathroom(params[:bathroom])
       
    # end

end
