class Frame < ApplicationRecord
  belongs_to :game
  has_many :throws

  #frame score
  def score
    throws.sum(:pins_knocked)
  end

  #check the throw is a strike or not
  def strike?
    throws.first&.pins_knocked == 10
  end

  #check the frame is a spare or not
  def spare?
    throws.count == 2 && score == 10
  end
end
