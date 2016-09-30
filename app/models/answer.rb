class Answer < ApplicationRecord

	# == Constants
	IxName = 0
	IxData = 1
	IxPicture = 2

  # == Model relationships
	belongs_to :quote

	def self::best_match_zodiac(profile, quote_id)
		z = Zodiac::new(birthday: profile['birthday'], gender: profile['gender'])
		me = Answer.find_by(alias: z.user_zodiac, quote_id: quote_id)
		match = Answer.find_by(alias: z.love_match, quote_id: quote_id)

		{
			:me => {
				:username => profile['name'],
				:avatar => profile['picture']['data']['url'],
				:picture => me.contents[IxPicture]
			},
			:match => {
				:content => match.contents[IxData],
				:picture => match.contents[IxPicture]
			}
		}
	end

end
