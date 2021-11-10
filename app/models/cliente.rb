class Cliente < ApplicationRecord
  belongs_to :user
  validates :name, :user, presence: true
  has_many :computer, dependent: :destroy
end
