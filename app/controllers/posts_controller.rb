class PostsController < ApplicationController

	def new
		@post = Post.new
<<<<<<< HEAD
  	end 

	def index # show all public's
  		@posts = Post.all
	end
=======
  	end  

	def index # show all public's
  		@posts = Post.all
	end 
>>>>>>> master

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
	def post_params
    	params.require(:post).permit(:title, :text)
  	end

  	def show # show current publication
  		@post = Post.find(params[:id])
  	end

  	def edit
  		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
  		@post = Post.find(params[:id])
  		@post.destroy 
  		redirect_to posts_path
	end

end
