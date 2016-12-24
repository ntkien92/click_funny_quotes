module SaveQuoteHelper
  ALPHABE = ("A".."Z").to_a
  COLS = %w(NAME TITLE DESCRIPTION LANGUAGE ANSWER CATEGORY BACKGROUND BACKGROUND2 COLOR COLOR2)
  CATEGORY_COLS = %w(NAME VN_CONTENT EN_CONTENT)

  def column_label(column, type = :cols)
    case type
    when :cols
      ALPHABE[COLS.index(column)]
    when :category
      ALPHABE[CATEGORY_COLS.index(column)]
    end
  end

  def content(sheet, i, label, cat = :cols)
    sheet.cell(i, column_label(label, cat))
  end

  def met
    p 1111111111111111111
    p @met2
    p @xlsx
    p @xlsx.sheet('Category')
    p @sheet
    p 9999999999999999999999999
    @xlsx.sheet('Category')
  end

  def import_categories
    category_sheet = @xlsx.sheet('Category')
    p @xlsx.sheet('Friends').cell(2, 'D')
    for i in category_sheet.first_row + 1..category_sheet.last_row do
      name = content(category_sheet, i, 'NAME', :category)
      p 8888888888888888888888
      p name
      p 8888888888888888888888
      unless Category.exists?(name: name)
        vn_content = content(category_sheet, i, 'VN_CONTENT', :category)
        en_content = content(category_sheet, i, 'EN_CONTENT', :category)
        Category.create!(name: name, vn_content: vn_content, en_content: en_content)
      end
    end
  end

  def friends_sheet_quote
    friend_sheet = @xlsx.sheet('Friends')
    for i in friend_sheet.first_row + 1..friend_sheet.last_row do
      category_name = content(friend_sheet, i, 'CATEGORY')
      category = Category.find_by(name: category_name)
      name = content(friend_sheet, i, 'NAME')
      main_quote = MainQuote.find_by(name: name) if name.present?
      if main_quote.blank?
        color = content(friend_sheet, i, 'COLOR').to_s
        color2 = content(friend_sheet, i, 'COLOR2').to_s      
        background = content(friend_sheet, i, 'BACKGROUND').to_s
        background2 = content(friend_sheet, i, 'BACKGROUND2').to_s

        main_quote = MainQuote.new
        main_quote.name = name
        main_quote.category_id = category.id
        main_quote.layout_id = Layout.find_by(name: 'layout_001').id
        main_quote.color = [color, color2]
        main_quote.background_url = [background, background2]
        main_quote.save!
      end

      title = content(friend_sheet, i, 'TITLE')
      quote = Quote.find_by(title: title) if title.present?
      if quote.blank?
        description = content(friend_sheet, i, 'DESCRIPTION')
        language = content(friend_sheet, i, 'LANGUAGE')

        quote = Quote.new
        quote.title = title
        quote.description = description
        quote.language = language
        quote.main_quote_id = main_quote.id
        quote.save!
      end

      acontent = content(friend_sheet, i, 'ANSWER')
      answer = Answer.find_by('contents @> ?', {data: acontent}.to_json)
      if answer.blank?
        quote.answers.create!(contents: {data: acontent})
      end
    end
  end
end