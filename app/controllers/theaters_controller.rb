class TheatersController < ApplicationController
    
    def index
        render json: Theater.all
    end

    def show
        theater = Theater.find_by_id(params[:id])
        if theater
            render json: theater, serializer: TheaterShowSerializer, status: :ok
        else
            render json: { error: "Theater not found" }, status: :not_found
        end
    end

    def create
        theater = Theater.create(theater_params)
        if theater.valid?
            render json: theater, status: :created
        else
            render json: { errors: theater.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        theater = Theater.find_by_id(params[:id])
        if theater
            theater.destroy
            head :no_content
        else
            render json: { error: "Theater not found" }, status: :not_found
        end
    end

    private
    def theater_params
        params.permit(:name, :capacity)
    end
end
