class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @tweets = Tweet.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @tweets = Tweet.all
  end

  # GET /articles/new
  def new
    @article = Article.new
    @tweets = Tweet.all
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
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
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  #def destroy
  #  @article.destroy
  #  respond_to do |format|
  #    format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  # GET articles/category/:category
  def category
    @articles = Article.where("category = '#{params[:category]}'")
    @tweets = Tweet.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
