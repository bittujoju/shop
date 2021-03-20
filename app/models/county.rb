class County < ApplicationRecord
  include Validations

  validates :name, :format => {:with => Validations.name_regex,
                               :message => "use letters, numbers, and _ please.",
                               :error_code => "Invalid Name"}
  validates_presence_of   :name, :message => "Name Required"
  validates_presence_of   :mark_up, :message => "MarkUp Required"
  validates_presence_of   :tax, :message => "Tax Required"
  validates_uniqueness_of :name, :message => "Name Exists"
  validates_uniqueness_of :slug, :message => "Slug Exists"

  before_save :add_slug

end
