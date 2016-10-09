namespace :db_tasks do
  desc "create quote/answers data"
  task create_data: :environment do
    create_data
  end

  def create_data
    c = Category.find_or_create_by(name: "Zodiac", en_content: "Zodiac", vn_content: "Cung Hoàng Đạo")
    l = Layout.find_or_create_by(name: "layout_001")
    background1 = Resource.find_or_create_by(data: "http://www.planwallpaper.com/static/images/recycled_texture_background_by_sandeep_m-d6aeau9_PZ9chud.jpg")
    mq = MainQuote.find_or_create_by(name: "Love Match", algorithm: "best_match_zodiac",
                      facebook_fields: "name,birthday,picture,gender",
                      category_id: c.id, layout_id: l.id)
    q = Quote.find_or_initialize_by(title: "Cung hoàng đạo nào hợp với bạn?", language: "vn", main_quote_id: mq.id)

    if (q.new_record?)
      q.save!
      answers =  [["Aries", ["Bạch Dương", "Nam Bạch Dương là người rất kiên gan, bền chí và thành thật. Điều đó sẽ đem lại cảm giác an toàn cho bạn.", "Nữ Bạch Dương có niềm tin mãnh liệt vào tình yêu, dù đó là “tình yêu sét đánh”, Tình yêu của bạn sẽ tồn tại mãi mãi."], "http://c5.staticflickr.com/9/8119/29991541676_7e700bfd79_m.jpg"],
                  ["Taurus", ["Kim Ngưu", "Nam Kim Ngưu là người biết tiến biết lùi đúng lúc, anh chàng sẽ luôn biết cách giữ thể diện và tạo sự vui vẻ, hài lòng cho bạn.", "Nữ Kim Ngưu là người thực tế và luôn muốn sự ổn định. Tình yêu của bạn sẽ tồn tại mãi mãi."], "http://c3.staticflickr.com/9/8425/29397847034_d49043a704_m.jpg"],
                  ["Gemini", ["Song Tử", "Nam Song Tử hoạt bát, thông minh sẽ kéo bạn ra khỏi cái vỏ ốc của mình, bước chân ra ngoài thế giới và tận hưởng những điều mới mẻ.", "Nữ Song Tử sở hữu tố chất thông minh và vẻ ngoài đáng yêu. Là lựa chọn sáng suốt nhất cho tình yêu của bạn."], "http://c3.staticflickr.com/6/5627/29397846954_62a5445914_m.jpg"],
                  ["Cancer", ["Cự Giải", "Nam Cự Giải hoàn toàn là mẫu người thích hợp, anh chàng có thể vạch ra những kế hoạch cụ thể và dẫn dắt bạn bước đi hạnh phúc trên con đường tương lai.", "Nữ Cự Giải rất thích được che chở và có bờ vai vững chắc để dựa vào. Rất thích hợp với đức tính chu đáo và đáng tin cậy của bạn đấy."],"http://c5.staticflickr.com/9/8114/29397846804_7aa4632459_m.jpg"],
                  ["Leo", ["Sư Tử", "Nam Sư Tử mạnh mẽ, nhiệt tình. Sự kết hợp hoàn hảo này sẽ khiến trái tim băng giá của bạn “tan chảy”.", "Nữ Sư Tử coi trọng sĩ diện, nhưng rất vui vẻ và cá tính. Cô nàng sẽ rất thích hợp cho bạn đấy!"], "http://c1.staticflickr.com/9/8279/29731717600_f424df370e_m.jpg"],
                  ["Virgo", ["Xử Nữ", "Nam Xử Nữ là người chu đáo, luôn dành thời gian chăm sóc người yêu khi có thể. Nếu yêu nam Xử Nữ, bạn nhất định sẽ hạnh phúc", "Nữ Xử Nữ là người cầu toàn, lo toan mọi thứ chu đáo sẽ khiến bạn cảm thấy vô cùng yên tâm và tin tưởng đấy."], "http://c5.staticflickr.com/9/8452/29397846604_f233d930b6_m.jpg"],
                  ["Libra", ["Thiên Bình", "Nam Thiên Bình có bề ngoài khá cuốn hút, lịch sự, nho nhã. Anh chàng có khả năng giúp bạn thu xếp mọi thứ một cách ổn thỏa nhất.", "Nữ Thiên Bình ngoan hiền lại rất hiểu tâm lí sẽ khiến bạn cảm thấy vô cùng hạnh phúc."], "http://c5.staticflickr.com/6/5656/29991542476_a5797187a6_m.jpg"],
                  ["Scorpio", ["Bọ Cạp", "Nam Bọ Cạp là người bí ẩn nhưng rất có tinh thần trách nhiệm, đối với mọi việc đều nỗ lực không ngừng.", "Nữ Bọ Cạp là người có chủ kiến và rất mạnh mẽ, điều này luôn khiến các chàng trai e ngại và… bỏ chạy. Nhưng bạn lại rất thích những cô gái như vậy đúng không?"], "http://c7.staticflickr.com/9/8256/29731717390_d1928fa6ee_m.jpg"],
                  ["Sagittarius", ["Nhân Mã", "Nam Nhân Mã biết cách nhường nhịn, không xen quá sâu vào cuộc sống riêng tư của mỗi người, điều này sẽ khiến bạn cảm thấy rất hài lòng.", "Nữ Nhân Mã có rất nhiều “vệ tinh” nhưng cô nàng lại rất khó rơi vào men say tình ái. Nhưng sẽ dễ khiến bạn sẽ bị cuốn hút và muốn được chinh phục."], "http://c1.staticflickr.com/9/8280/29991542136_f50901fcee_m.jpg"],
                  ["Capricornus", ["Ma Kết", "Nam Ma Kết là người làm mọi việc luôn đến nơi đến chốn, cộng thêm đầu óc nhanh nhạy sẽ khiến bạn yên tâm và ngưỡng mộ", "Nữ Ma Kết lý trí và bình lặng nhưng cũng rất lãng mạn trong tình yêu, chỉ là không biết cách thể hiện ra mà thôi."], "http://c7.staticflickr.com/9/8773/29991542086_c61c03cc2e_m.jpg"],
                  ["Aquarius", ["Bảo Bình", "Nam Bảo Bình rất lý trí, tinh tế, điềm đạm, đáng tin cậy. Những ưu điểm này khiến bạn cảm thấy yên tâm để dựa dẫm.", "Nữ Bảo Bình là người khá nhiệt tình, hoạt bát và vui vẻ. Nếu là một cặp, cả hai chắc chắn sẽ hạnh phúc."], "http://c3.staticflickr.com/6/5168/29991541906_ae2972be73_m.jpg"],
                  ["Pisces", ["Song Ngư", "Nam Song Ngư dịu dàng, bình lặng như mặt nước hồ, sẽ khiến cho bạn luôn trong trạng thái lâng lâng hạnh phúc.", "Nữ Song Ngư bề ngoài dịu dàng, yếu đuối, luôn muốn tìm kiếm một chỗ dựa vững chắc."], "http://c5.staticflickr.com/9/8452/29731716900_011cfa7d6b_m.jpg"]
                ]
      answers.each do |a|
        r = Resource.find_or_create_by(data: a[2])
        Answer.create!(alias: a[0], contents: a[1], quote_id: q.id, resource_id: r.id)
      end
    end

  end

end
