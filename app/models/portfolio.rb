class Portfolio < ApplicationRecord
  Validates_presence_of :title, :body, :main_image, :thumb_image
end
