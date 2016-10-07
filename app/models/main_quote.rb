class MainQuote < ApplicationRecord
  # == Model relationships
  belongs_to :category
  belongs_to :layout

end
