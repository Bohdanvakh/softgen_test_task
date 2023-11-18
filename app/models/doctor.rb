class Doctor < ApplicationRecord
  include DeviseMethods

  belongs_to :category
  has_many :appointments
  has_many :patients, through: :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :by_category, -> (category) { where(category_id: category) if category.present? }
end
