class Quote < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # == Model relationships
  belongs_to :main_quote
  has_many :answers

  # == Instance methods
  def get_answer(koala_user)

    fields = main_quote.facebook_fields

    if fields.exclude? "friends"
      query_str = Field::replace_userfield(fields)
      profile = koala_user.get_object("me" + query_str)
      answer_hash = Answer.send(main_quote.algorithm, profile, id)
    else
      friend_query_str = Field::replace_friendfield(fields)
      query_str = friend_query_str.gsub("taggable_friends", "")

      friends = koala_user.get_connections("me", friend_query_str)
      profile = koala_user.get_object("me" + query_str)
      answer_hash = Answer.send(main_quote.algorithm, friends, id)
    end

    answer_hash.merge!(Quote.common_attrs(profile, main_quote))
  end

  def normalize_friendly_id(slug_key)
    slug_key.convert_vi_to_en.parameterize
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
