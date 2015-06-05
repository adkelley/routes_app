class PlanesController < ApplicationController
  # handle all planes
  def index
    # Note it used to say
    # render text: "Hello, pilots." but
    # we'll let app/views/index.html.erb
    # handle it.
    # Note: render comes from ApplicationController::Base

    # Controller uses the model to get all the planes
    # Note this can be really slow for large databases
    # The server isn't doing anyting in the meantime
    @planes = Plane.all
    render :index
  end

  # tell the view to render the planes/new page
  def new
    render :new
  end

  # tell the model to create a new plane with
  # the params that came from planes/new
  def create
    # raise params.inspect
    plane_params = params.require(:plane).permit(:name, :design, :description)
    plane = Plane.create(plane_params)
    redirect_to "/planes/#{plane.id}"
  end

  def show
    plane_id = params[:id]  # index starts at 1
    #raise params.inspect
    @plane = Plane.find(plane_id) # alternative find_by_id
    render :show
  end

  def edit
    plane_id = params[:id]
    #raise params.inspect
    @plane = Plane.find(plane_id)
    render :edit
  end

  def update
    plane_id = params[:id]
    plane = Plane.find(plane_id)

    # get updated data
    updated_attributes = params.require(:plane).permit(:name, :design, :description)
    # update the plane
    plane.update_attributes(updated_attributes)

    # redirect to show
    redirect_to "/planes/#{plane_id}"
    
  end
  
end


