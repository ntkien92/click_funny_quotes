class AdminsController < ApplicationController
  require 'roo'
  include SaveQuoteHelper

  FRIEND_SHEET = 'Friends'
  def upload_quote
  end

  def save_quote
    file = params[:quote_link]
    xlsx = Roo::Spreadsheet.open(file)
    sheets = xlsx.sheets
    @sheets = sheets
    @xlsx = xlsx
    @met2 = "dafasdf"
    import_categories
    if sheets.include? FRIEND_SHEET
      friends_sheet_quote
    end
  end
end