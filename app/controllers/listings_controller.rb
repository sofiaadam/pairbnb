class ListingsController < ApplicationController
    before_action :find_listing, only: [:show, :update, :edit, :destroy]


    def index
        @listing = Listing.all.order("created_at DESC")
        # @tag = Tag.new
        @searchlistings = Listing.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
        
        # @form = SearchForm.new(params.require ( :search_form))
        # @searchform
    end

    # def index
	#   if params[:title]
	#     @searchlistings = Listing.where(title: params[:title]).paginate(page: params[:page], per_page: 10)
	#   else
	#     @searchlistings = Listing.all.paginate(page: params[:page], per_page: 10)
	#   end
	# end


    #render listing form
    def new
        @listing = Listing.new
            # if current_user.customer?
            # flash[:notice] = "Sorry. You are not allowed to perform this action."
            # return redirect_to root_path, notice: "Sorry. You do not have the permission to verify a property."
        @new_tags = @listing.tags.new
        #  end
    end

    def create
        
        @listing = Listing.new(listing_params)
        @listing.user_id = current_user.id
        if @listing.save
            # @new_tags = params[:listing][:tag][:tag].downcase.split(",") 
            # #think of what to do after this.
            redirect_to @listing
        else
            render 'new'
        end
    end

    def search
       @num_bathroom = Listing.bathroom(params[:bathroom])
       @price_range = Listing.min_max_price(params[:min], params[:max])
    #    respond_to do |format|
    #        format.js
    end
    

    # def find 
    #     findsearch = SearchForm.new
    # end

    def show
        @reservation = Reservation.new
    end
    
    def edit
    end

    def update
        @listing.update(listing_params)
        @listing.user_id = current_user.id
        redirect_to @listing
    end

    def destroy 
        @listing.destroy
        redirect_to root_path
    end
    

    

    private
    def listing_params
        params.require(:listing).permit(:title, :description, :property_type, :room_type, :guest, :bedroom, :bathroom, :price, :address, {:tag_ids => [] }, {images: []})
    end

    def find_listing
        @listing = Listing.find(params[:id])
    end
    
end




 