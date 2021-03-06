class Movie < ApplicationRecord
  # Direct associations

  has_many   :characters,
             :dependent => :destroy

  belongs_to :filmography,
             :class_name => "Director",
             :foreign_key => "director_id",
             :counter_cache => true

  # Indirect associations

  has_many   :actors,
             :through => :characters,
             :source => :actor

  # Validations

  validates :director_id, :presence => true

  validates :title, :uniqueness => { :scope => [:years] }

  validates :title, :presence => true

  validates :years, :numericality => { :greater_than => 1870, :greater_than_or_equal_to => 2050 }

end
