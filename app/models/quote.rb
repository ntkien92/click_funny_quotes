class Quote < ApplicationRecord

  # == Model relationships
  belongs_to :main_quote

  # == Instance methods
  def get_answer(koala_user)
    query_str = main_quote.facebook_fields.present? ? ("?fields=" + main_quote.facebook_fields.gsub("picture", "picture.type(large)")) : ""
    profile = koala_user.get_object("me" + query_str)

    answer_hash = Answer.send(main_quote.algorithm, profile, id)
    answer_hash.merge!(layout: main_quote.layout.name)
  end
end
