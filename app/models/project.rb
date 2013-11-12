class Project < ActiveRecord::Base
  has_many :pictures, as: :pictureable, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
  attr_accessible :description, :title, :pictures_attributes

end
