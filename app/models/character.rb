class Character < ActiveRecord::Base

  belongs_to :television_show

  validates :television_show_id,
    presence: true

  validates :character,
    presence: true,
    uniqueness: true

  validates :actor,
    presence: true

end
