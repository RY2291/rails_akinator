class ProgressesController < ApplicationController
  def new
    @progress = Progress.new
    @question = Question.first
  end

  def create
    current_game = Game.find(params[:game_id])
    progress = current_game.progresses.new(create_params)
    progress.assign_sequence
    progress.save
    redirect_to new_game_progresses_path(current_game)
  end


  private

  def create_params
    params.require(:progress).permit(:question_id, :answer, :game_id)
  end
end
