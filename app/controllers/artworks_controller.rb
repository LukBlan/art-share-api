class ArtworksController < ApplicationController
  def index
    render json: Artwork.select("artworks.*")
                        .joins(:shares)
                        .where(artist_id: params[:user_id])
                        .or(ArtworkShare.where(viewer_id: params[:user_id]))
  end

  def show
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      render json:artwork
    else
      render json: {error_message: "Artwork doesn't exist"}, status: :unprocessable_content
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      artwork.destroy
      render json: artwork
    else
      render json: {message: "Artwork doesn't exist"}
    end
  end

  def create
    artwork = Artwork.new(artworks_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_content
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      artwork.update(artworks_params)
      render json: artwork
    else
      render json: {message: "Artwork doesn't exist"}
    end
  end

  private
  def artworks_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
