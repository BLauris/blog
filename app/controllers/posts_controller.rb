class PostsController < ApplicationController

	# authentificate user's 
	http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show] 


	def new
		puts @post = Post.new			
  	end 
 	    	
	def index # show all public's
  		@posts = Post.all
	end 

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
