class Product < ActiveRecord::Base
  include SlugIt
  include Validations

  belongs_to :brand

  validates :name, :format => {:with => Validations.name_regex,
             :message => "use letters, numbers, and _ please.",
             :error_code => "Invalid Name"}
  validates_presence_of   :name, :message => "Name Required"
  validates_presence_of   :cost_price, :message => "Cost Price Required"
  validates_uniqueness_of :name, :message => "Name Exists"
  validates_uniqueness_of :slug, :message => "Slug Exists"

  before_save :add_slug

  def add_slug
    self.slug = make_slug(self.name)
  end
end
