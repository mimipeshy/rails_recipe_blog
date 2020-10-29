class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authorize, except: %i[index show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order('created_at DESC')
    @top_article = Article.featured_article
    @top_cake = Article.top_category(1)
    @top_pastries = Article.top_category(2)
    @top_drinks = Article.top_category(3)
    @top_food = Article.top_category(4)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @user = User.find(@article.user_id)
    # @comment = Comment.new
    # @comment.article_id = @article.id
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  # POST /articles.json
  def create
    @user = current_user
    @article = @user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        @user.articles << @article
        format.html { redirect_to @article, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Recipe was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :image, :category_list)
  end
end
