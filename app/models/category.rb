class Category < ApplicationRecord
  has_many :doctors

  validates :name, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["doctors"]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + %w[doctors_id name]
  end
end
