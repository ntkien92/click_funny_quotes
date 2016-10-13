class Field

  # == Constants
  FEMALE = "female"
  MALE = "male"
  BIRTHDAY_FORMAT = "%m/%d/%Y"
  HEIGHT = 320
  WIDTH = 320


  def self.format_date(date)
    Date.strptime(date, BIRTHDAY_FORMAT)
  end

  def self.replace_userfield(fields)
    fields.present? ? ("?fields=" + fields.gsub("picture", "picture.width(#{WIDTH}).height(#{HEIGHT})")) : ""
  end

  def self.replace_friendfield(fields)
    fields.gsub("friends?", "taggable_friends?fields=").gsub("picture", "picture.width(#{WIDTH}).height(#{HEIGHT})")
  end
end