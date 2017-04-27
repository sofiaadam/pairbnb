class ListingsController < ApplicationController
    before_action :find_listing, only: [:show, :update, :edit, :destroy]


    def index
        @listing = Listing.all
    end

    #render listing form
    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.user_id = current_user.id
        if @listing.save
            redirect_to @listing
        else
            render 'new'
        end
    end

    def show
    end
    
    def edit
    end
    

    private
    def listing_params
        params.require(:listing).permit(:title, :description, :property_type, :room_type, :guest, :bedroom, :bathroom, :price, :address)
    end

    def find_listing
        @listing = Listing.find(params[:id])
    end
    


    
    
end



  