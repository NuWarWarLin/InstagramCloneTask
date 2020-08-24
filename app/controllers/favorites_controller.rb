class FavoritesController < ApplicationController

    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to posts_url, notice: "#{favorite.post.user.name}'s post registered as a favorite"
    end

    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to posts_url, notice: "#{favorite.post.user.name}'s post remove from favorite"
    end
 
    def index
        @users = current_user
        @posts = @user.favorite_posts
        @favorite = current_user.favorites.all
    end

end
