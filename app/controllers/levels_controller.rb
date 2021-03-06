class LevelsController < ApplicationController

  def index
    @levels = Level.all
    render('levels/index.html.erb')
  end

  def new
    @level = Level.new
    render('levels/new.html.erb')
  end

  def create
    @level = Level.create(params[:level])
    if @level.valid?
      flash[:notice] = "Your level was added successfully!"
      redirect_to("/levels/#{@level.id}")
    else
      flash[:alert] = "Bummer... looks like there are some things that need fixing here."
      render('levels/new.html.erb')
    end
  end

  def show
    @level = Level.find(params[:id])
    render('levels/show.html.erb')
  end

  def edit
    @level = Level.find(params[:id])
    render('levels/edit.html.erb')
  end

  def update
    @level = Level.find(params[:id])
    if @level.update(params[:level])
      flash[:notice] = "Your level was added successfully!"
      redirect_to("/levels/#{@level.id}")
    else
      flash[:alert] = "Bummer... looks like there are some things that need fixing here."
      render('levels/edit.html.erb')
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.delete
    redirect_to("/levels")
  end

end
