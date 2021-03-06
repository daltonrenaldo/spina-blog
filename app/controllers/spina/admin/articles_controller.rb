module Spina
  module Admin
    class ArticlesController < AdminController
      before_filter :set_breadcrumb
      before_action :set_article, only: [:show, :edit, :update, :destroy]

      layout "spina/admin/website"

      def show
      end

      def index
        @articles = Article.order("draft desc, created_at desc")
      end

      def new
        add_breadcrumb "New article", spina.new_admin_article_path
        @article = Article.new
      end

      def edit
        add_breadcrumb @article.title
      end

      def create
        add_breadcrumb "New article"
        @article = Article.new(article_params.merge(created_by: current_user.id))
        if @article.save
          redirect_to spina.admin_articles_url, notice: "Article successfully created"
        else
          render :new
        end
      end

      def update
        add_breadcrumb @article.title
        if @article.update_attributes(article_params)
          redirect_to spina.admin_articles_url, notice: "Article saved"
        else
          render :edit
        end
      end

      def destroy
        @article.destroy
        redirect_to spina.admin_articles_url, notice: "The article has been deleted"
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end

      def set_breadcrumb
        add_breadcrumb "Articles", spina.admin_articles_path
      end

      def article_params
        params.require(:article).permit(:title, :subtitle, :content, :excerpt, :draft,
                                        :publish_date, :author_id,
                                        :header_photo, :seo_title, :meta_description, :category_ids => [])
      end
    end
  end
end
