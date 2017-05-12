class Round < ActiveRecord::Base
  belongs_to :user
  has_one :deck
end
