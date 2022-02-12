class Progress < ApplicationRecord
  belongs_to :game
  has_one :question
end
