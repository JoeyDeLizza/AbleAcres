class PicturesController < ApplicationController
    def new
        @picture = Picture.new
    end
    def index
        @pictures = Picture.all
    end
    
    def create
        @picture = Picture.create(picture_params)
    end
    
    def show
        @pictures = Picture.all
    end
    
    private
    def picture_params
        params.require(:picture).permit(:image)
    end
end
