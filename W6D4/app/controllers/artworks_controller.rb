class ArtworksController < ApplicationController
  def index
    if params[:user_id]
      # artwork = Artwork.joins(:artwork_shares).where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', params[:user_id], params[:user_id])
      own_artworks = Artwork.where(artist_id: params[:user_id])
      share_artwork = User.find(params[:user_id]).shared_artworks
      render json: own_artworks + share_artwork
    else
      artwork = Artwork.all
      render json: artwork
    end
  end

  def create
    artwork = Artwork.new(artworks_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.save
      artwork.update(artworks_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
  end
  
  private
  def artworks_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
