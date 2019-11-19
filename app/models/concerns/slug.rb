module Slug
  module InstanceMethods

    def slug
      slug = self.name.downcase.gsub(" ", '-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      item = self.find_by(name: slug.titleize.gsub("-", " "))
      item
    end
  end
end
