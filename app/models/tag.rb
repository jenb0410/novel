class Tag < ApplicationRecord
  belongs_to :story
  has_and_belongs_to_many :stories
end
