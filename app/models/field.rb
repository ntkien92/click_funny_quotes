class Field

  # == Constants
  FEMALE = "female"
  MALE = "male"
  BIRTHDAY_FORMAT = "%m/%d/%Y"


  def self.format_date(date)
    Date.strptime(date, BIRTHDAY_FORMAT)
  end
end