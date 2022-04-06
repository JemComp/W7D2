class AlbumsController < ApplicationController

    def new
        render :new
    end

    def create
        @album = Album.new(params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def show
        @album = Album.find_by(:id [params[:id]])
        render :show
    end

    def update
        @album = album.find_by(:id [params[:id]])
        if @album.update_atributes(band_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        @album = album.find_by(:id [params[:id]])
        @album.destroy
        redirect_to bands_url

    end


    private
    def album_params
        params.require(:album).permit(:title, :year, :studio, :band_id)
    end
end
