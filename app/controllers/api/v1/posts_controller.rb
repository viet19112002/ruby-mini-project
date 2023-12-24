class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.all
    if posts
      render json: posts, status: 200
    else
      render json: {error: "Unable to retrieve articles."}
  end
  end

  def show
     posts = Post.find_by(:id => params[:id])
      if posts
        render json: posts, status: 200
      else
        render json: {
          error: "Unable to retrieve article."
        }
      end
  end

  def create
     posts = Post.new(
      title: arti_params[:title],
      body: arti_params[:body],
      author: arti_params[:author]
      )
      if posts.save
        render json: posts , status: 200
      else
        render json: {error: "Unable to create article."}

      end

  end

  def update
    posts = Post.find_by(:id => params[:id])
    if posts
      posts.update(title: params[:title], body: params[:body], author: params[:author])
      render json: "Article updated successfully."
    else
      render json:
      {
        error: "Unable to update article."
      }
    end
  end

  def destory
    posts = post.find_by(:id => params[:id])
    if posts
      posts.destory
      render json: "Article deleted successfully."
    else

    end
  end
  def arti_params
    params.require(:post).permit(:title, :body, :author)
  end
end
