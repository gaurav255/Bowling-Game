class Game < ApplicationRecord
  has_many :frames

  enum status: ["Ongoing", "Complated"]

  #calucalating the complete score of the game
  def calculate_score
    total_score = 0
    frames.each_with_index do |frame, index|
      total_score += frame.score
      if frame.strike?
        total_score += next_two_throws_score(index)
      elsif frame.spare?
        total_score += next_throw_score(index)
      end
    end
    total_score
  end

  private

  def next_throw_score(index)
    next_frame = frames[index + 1]
    return 0 if next_frame.nil?

    next_frame.throws.first&.pins_knocked || 0
  end

  def next_two_throws_score(index)
    next_frame = frames[index + 1]
    return 0 if next_frame.nil?

    if next_frame.strike?
      next_frame_score = 10
      next_next_frame = frames[index + 2]
      next_frame_score += next_next_frame&.throws&.first&.pins_knocked || 0
    else
      next_frame_score = next_frame.score
    end
    next_frame_score
  end
end
