module SlugIt

  def make_slug(name)
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
