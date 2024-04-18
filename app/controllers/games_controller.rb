class GamesController < ApplicationController
  
  #Api to start the game
  def start
    @game = Game.create
    render json: { message: 'New game started', game: @game }
  end

  #Api to fetch the score of the game
  def score
    @game = Game.find_by(id: params[:id])
    if @game.present?
    	render json: @game
    else
    	render json: {error: "Invalid Game ID"}
    end
  end
end
