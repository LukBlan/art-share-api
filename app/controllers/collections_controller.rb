class CollectionsController < ApplicationController
  def create
    collection = Collection.new(user_id: params[:user_id], name: collections_params[:name])

    if collection.save
      render json: collection
    else
      render json: collection.errors.full_messages
    end
  end

  private
  def collections_params
    params.require(:collection).permit(:name)
  end
end
