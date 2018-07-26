class LandingPagesController < ApplicationController
  def index
    @landing_pages = LandingPage.page(params[:page]).per(10)

    render("landing_pages/index.html.erb")
  end

  def show
    @landing_page = LandingPage.find(params[:id])

    render("landing_pages/show.html.erb")
  end

  def new
    @landing_page = LandingPage.new

    render("landing_pages/new.html.erb")
  end

  def create
    @landing_page = LandingPage.new

    @landing_page.email = params[:email]
    @landing_page.answer = params[:answer]
    @landing_page.question_num = params[:question_num]

    save_status = @landing_page.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/landing_pages/new", "/create_landing_page"
        redirect_to("/landing_pages")
      else
        redirect_back(:fallback_location => "/", :notice => "Landing page created successfully.")
      end
    else
      render("landing_pages/new.html.erb")
    end
  end

  def edit
    @landing_page = LandingPage.find(params[:id])

    render("landing_pages/edit.html.erb")
  end

  def update
    @landing_page = LandingPage.find(params[:id])

    @landing_page.email = params[:email]
    @landing_page.answer = params[:answer]
    @landing_page.question_num = params[:question_num]

    save_status = @landing_page.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/landing_pages/#{@landing_page.id}/edit", "/update_landing_page"
        redirect_to("/landing_pages/#{@landing_page.id}", :notice => "Landing page updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Landing page updated successfully.")
      end
    else
      render("landing_pages/edit.html.erb")
    end
  end

  def destroy
    @landing_page = LandingPage.find(params[:id])

    @landing_page.destroy

    if URI(request.referer).path == "/landing_pages/#{@landing_page.id}"
      redirect_to("/", :notice => "Landing page deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Landing page deleted.")
    end
  end
end
