class FavoritesController < ApplicationController

    def index
        @user = current_user
        @posts = @user.favorite_posts
        @favorite = current_user.favorites.all
    end

    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to post_path(params[:post_id]), notice: "post registered as a favorite"
    end

    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to posts_path, notice: "post remove from favorite"
    end

end
