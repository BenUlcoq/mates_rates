class PagesController < ApplicationController

  before_action :authenticate_user!, only: :profile

  def show
    
    if params[:page] == 'home'
      @tools = Tool.last(12)
    end

    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def profile
  end

  def search

  end

  def results
    pp params
    @query = params[:query]
    if @query
      @tools = Tool.search(params[:query])
    else
      redirect_to tools_path
    end
  end

  def redirect_to_results
    redirect_to results_path(params[:query])
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end
