class Answer < ApplicationRecord

  # == Constants
  IxName = IxContent = 0

  # == Model relationships
  belongs_to :resource, optional: true
  belongs_to :quote

  # == Public methods
  def self::best_match_zodiac(profile, quote_id)

    z = Zodiac::new(birthday: profile['birthday'], gender: profile['gender'])
    me = Answer.find_by(alias: z.user_zodiac, quote_id: quote_id)
    match = Answer.find_by(alias: z.love_match, quote_id: quote_id)
    content = z.gender == Field::FEMALE ? match.contents[1] : match.contents[2]

    {
        :l_picture => me.resource.data,
        :l_text => me.contents[IxName],
        :r_picture => match.picture,
        :r_text => match.contents[IxName],
        :content => content,
    }
  end

  def self.random_answer(profile, quote_id)
    quote = Quote.find(quote_id)
    ranswer = quote.answers.sample(1).first

    {
      :r_picture => ranswer.picture,
      :r_text => ranswer.alias
    }
  end

  def self.random_friend(friends, quote_id)
    friend = friends.sample
    ranswer = Answer.find_by(quote_id: quote_id)
    content = ranswer.contents[IxContent].gsub("$RTEXT$", friend['name'])
    {
      :r_picture => friend['picture']['data']['url'],
      :r_text => friend['name'],
      :content => content
    }
  end

  # == Instance methods
  def picture
    resource.try(:data)
  end

end
