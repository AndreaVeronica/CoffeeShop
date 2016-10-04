class Coffeeshop < ApplicationRecord
  validates :name, presence: true

  before_save :default_values

  belongs_to :user

  private


  def default_values
                          # required so that the TX will not rollback!!!
  end
end
