module Validations

  mattr_accessor :name_regex

  self.name_regex = /\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i
end
