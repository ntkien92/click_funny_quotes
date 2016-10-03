class Zodiac

	# == Constants
	ZODIAC_SIGN = {
		:Aries => ["21/3", "20/4"], # Bach Duong
		:Taurus => ["21/4", "21/5"], # Kim Nguu
		:Gemini => ["22/5", "21/6"], # Song Tu
		:Cancer => ["22/6", "23/7"], # Cu Giai
		:Leo => ["24/7", "23/8"], # Su Tu
		:Virgo => ["24/8", "23/9"], # Xu Nu
		:Libra => ["24/9", "23/10"], # Thien Binh
		:Scorpio => ["24/10", "22/11"], # Bo Cap
		:Sagittarius => ["23/11", "21/12"], # Nhan Ma
		:Capricornus => ["22/12", "20/1"], # Ma Ket
		:Aquarius => ["21/1", "19/2"], # Bao Binh
		:Pisces => ["20/2", "20/3"], # Song Ngu
	}

	LOVE_MATCH = {
		:Aries => :Pisces,
		:Taurus => :Aquarius,
		:Gemini => :Libra,
		:Cancer => :Virgo,
		:Leo => :Taurus,
		:Virgo => :Capricornus,
		:Libra => :Aries,
		:Scorpio => :Sagittarius,
		:Sagittarius => :Leo,
		:Capricornus => :Pisces,
		:Aquarius => :Scorpio,
		:Pisces => :Cancer,
	}

	# == Initialize Method
	def initialize(attributes = {})
	   # facebook birthday format
	   @birthday = attributes[:birthday].present? ? Date.strptime(attributes[:birthday], "%m/%d/%Y") : DateTime.new(1992, 5, 31)
	   @gender = attributes[:gender]
	end

	# == Instance methods
	def user_zodiac
		ZODIAC_SIGN.each do |p|
			duration = p.second
			first_date = Date.parse(duration[0] + "/" + @birthday.year.to_s)
			second_date = Date.parse(duration[1] + "/" + @birthday.year.to_s)
			return p.first if @birthday.between?(first_date, second_date)
		end
	end

	def love_match
		Field::FEMALE == @gender ? LOVE_MATCH[user_zodiac] : LOVE_MATCH.key(user_zodiac)
	end

end