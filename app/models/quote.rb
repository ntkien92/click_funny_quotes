class Quote < ApplicationRecord
	# == Model relationships
	belongs_to :category
  belongs_to :layout

  # == Instance methods
	def get_answer(koala_user)
		query_str = facebook_fields.present? ? ("?fields=" + facebook_fields) : ""
		profile = koala_user.get_object("me" + query_str)

		Answer.send(algorithm, profile, id)
	end
end
