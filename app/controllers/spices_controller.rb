class SpicesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    # GET /spices: return an array of all spices
    def index
        spices = Spice.all
        render json: spices
    end

    # GET /spices/:id: return a single spice
    # def show
    #     spice = Spice.find(params[:id])
    #     render json: spice
    # end

    # POST /spices: create a new spice
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH /spices/:id: update an existing spice
    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    # DELETE /spices/:id: delete an existing spice
    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def record_not_found
        render json: { error: "Spice not found" }, status: :not_found
    end
end
