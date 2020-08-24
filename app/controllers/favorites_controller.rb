class FavoritesController < ApplicationController

    def show
        @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    end
end
