class ThrowsController < ApplicationController
  
  #Api to record the throw 
  def create
  	game = Game.find_by(id: params[:game_id])
  	return render json: {error: "Invalid Game ID"} unless game.present?
    frame = Frame.find_or_create_by(game_id: params[:game_id], id: params[:frame_id])
    throws = frame.throws.create(pins_knocked: params[:pins_knocked])
    render json: { message: 'Throw Recorded Successfully!', throw: throws }
  end
end
