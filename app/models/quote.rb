class Quote < ApplicationRecord

  # == Model relationships
  belongs_to :main_quote
  has_many :answers

  # == Instance methods
  def get_answer(koala_user)
    query_str = main_quote.facebook_fields.present? ? ("?fields=" + main_quote.facebook_fields.gsub("picture", "picture.type(large)")) : ""
    profile = koala_user.get_object("me" + query_str)

    answer_hash = Answer.send(main_quote.algorithm, profile, id)
    answer_hash.merge!(Quote.common_attrs(profile, main_quote))
  end

  private

  def self.common_attrs(profile, main_quote)
    {
      :username => profile['name'],
      :avatar => profile['picture']['data']['url'],
      :layout => main_quote.layout.name
    }
  end
end
