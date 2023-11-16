class AddAssociationDoctorCategory < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :doctors, :category
  end
end
