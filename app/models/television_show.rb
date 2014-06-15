class TelevisionShow < ActiveRecord::Base
  validates :title, presence: true
end
