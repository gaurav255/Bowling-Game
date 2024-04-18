class Throw < ApplicationRecord
  belongs_to :frame

  #update the game status after 10 frames
  after_create do |object|
  	if object.frame.game.frames.count == 5 && object.frame.throws.count == 2
  		object.frame.game.update_attribute(:status, "Completed")
  	end
  end
end
