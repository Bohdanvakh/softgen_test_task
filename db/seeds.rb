# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', phone: '1234567890', password: 'password', password_confirmation: 'password')
  Doctor.create!(email: 'doctor@example.com', phone: '0987654321', password: 'password', password_confirmation: 'password')
  Patient.create!(email: 'patient@example.com', phone: '0000000001', password: 'password', password_confirmation: 'password')
  Category.create!(name: 'therapist')
  Category.create!(name: 'dentist')
end
