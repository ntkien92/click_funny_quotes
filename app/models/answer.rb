class Answer < ApplicationRecord

	# == Constants
	IxName = 0

  # == Model relationships
	belongs_to :resource
	belongs_to :quote

	def self::best_match_zodiac(profile, quote_id)

		z = Zodiac::new(birthday: profile['birthday'], gender: profile['gender'])
		me = Answer.find_by(alias: z.user_zodiac, quote_id: quote_id)
		match = Answer.find_by(alias: z.love_match, quote_id: quote_id)
		content = z.gender == Field::FEMALE ? match.contents[1] : match.contents[2]

		{
				:username => profile['name'],
				:avatar => profile['picture']['data']['url'],
				:l_picture => me.resource.data,
				:l_text => me.contents[IxName],
				:r_picture => match.resource.data,
				:r_text => match.contents[IxName],
				:content => content,
		}
	end

end
