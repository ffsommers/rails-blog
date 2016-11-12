class ArticlesController < ApplicationController


	def index
		@articles = Article.all
	end

	def show
		if !current_user
			redirect_to new_user_session_path
		else
			@article = Article.find(params[:id])
		end
	end


	def new
   if !current_user
      redirect_to new_user_session_path
    else
		@article = Article.new
	end

	def edit
    if !current_user
      redirect_to new_user_session_path
    else
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

    if @article.save
	respond_to do |format|
    # if the response fomat is html, redirect as usual
      format.html { redirect_to articles_path }
      format.json { render json: @article }


    # if the response format is javascript, do something else...
      format.js { }
    end
   end
end

def update
	@article = Article.find(params[:id])

	if @article.update(article_params)
		redirect_to @article
	else
		render 'edit'
	end
end

def destroy
  if !current_user
      redirect_to new_user_session_path
    else
	@article = Article.find(params[:id])
	@article.destroy

	redirect_to articles_path
end

private
def article_params
	params.require(:article).permit(:title, :text)
end

end
