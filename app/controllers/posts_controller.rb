class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end


    def show
        @favorite = current_user.favorites.find_by(post_id: @post.id)
    end


    def new
        @post = Post.new
    end


    def edit

    end


    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if params[:back]
            render :new
        else
            if @post.save
                flash[:notice] = "Congratulations! You are post is successfully created!"
                redirect_to @post
            else
                render 'new'
            end
        end
    end

    def update
        if @post.update(post_params)
            flash[:notice] = "Congratulations! You are post is successfully Edited!"
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        if @post.destroy
            flash[:notice] = "Congratulations! You are post is successfully Deleted!"
            redirect_to posts_path
        end
    end

    def confirm
        @post = Post.new(post_params)
        @post.user = current_user
        render :new if @post.invalid?
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:name, :picture, :picture_cache, :user_id)
    end

    def require_same_user
        if current_user != @post.user
            flash[:alert] = "You can't delete or edit other users' data!"
            redirect_to @post
        end
    end
  
end
