class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def add_slug
    self.slug = make_slug(self.name)
  end
end
