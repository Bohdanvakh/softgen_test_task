class Patient < ApplicationRecord
  include DeviseMethods

  has_many :appointments
  has_many :doctors, through: :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_associations(auth_object = nil)
    super + %w["appointments", "doctors"]
  end


  def self.ransackable_attributes(auth_object = nil)
    super
  end
end
