namespace :db_tasks do
  desc "create quote/answers data"
  task create_data: :environment do
    create_data
  end

  def create_data
    c = Category.create!(name: "Zodiac")
    l = Layout.create!(name: "temp1", layer: "13423")
    q = Quote.create!(name: "Love Match", algorithm: "best_match_zodiac",
                      facebook_fields: "name,birthday,picture,gender",
                      category_id: c.id, layout_id: l.id, language: "vn")

    answers =  [["Aries", ""],
                ["Taurus", "", "http://c3.staticflickr.com/9/8425/29397847034_d49043a704_m.jpg"],
                ["Gemini", ""],
                ["Cancer", ""],
                ["Leo", ""],
                ["Virgo", ""],
                ["Libra", ""],
                ["Scorpio", ""],
                ["Sagittarius", ""],
                ["Capricornus", ""],
                ["Aquarius", ""],
                ["Pisces", ""]
              ]
    answers.each do |a|
      Answer.create!(alias: a.first, contents: a, quote_id: q.id)
    end

  end

end
