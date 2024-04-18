class GameSerializer < ActiveModel::Serializer
	attributes *[
		:id,
		:total_score,
		:status,
		:frames,
	]

	attribute :total_score do |object|
		object.object.calculate_score
	end

	attribute :frames do |object|
		object.object.frames.map do |frame|
			{
				frame_id: frame.id,
				frame_score: frame.score,
				throws: frame.throws
			}
		end
	end
end
