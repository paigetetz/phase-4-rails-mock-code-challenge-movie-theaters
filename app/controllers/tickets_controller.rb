class TicketsController < ApplicationController


    def create
        theater = Ticket.create(ticket_params)
        if theater.valid?
            render json: theater, serializer: TicketCreateSerializer, status: :created
        else
            render json: {errors: theater.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def ticket_params
        params.permit(:price, :guest_id, :theater_id)
    end
end
