class Computer < ApplicationRecord
  belongs_to :cliente
  validates :equipamento, :cliente, presence: true
end
