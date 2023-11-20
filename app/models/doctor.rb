class Doctor < ApplicationRecord
  include DeviseMethods

  belongs_to :category, optional: true
  has_many :appointments
  has_many :patients, through: :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :by_category, -> (category) { where(category_id: category) if category.present? }

  validates :phone, presence: true, length: { is: 10 }

  def self.ransackable_associations(auth_object = nil)
    ["appointments", "category", "patients"]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + %w[first_name last_name]
  end
end
