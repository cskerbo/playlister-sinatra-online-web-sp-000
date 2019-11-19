module Slug
  module InstanceMethods

    def slug
      artist_name = self.name
      slug = artist_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      item = self.find_by(name: slug.titleize.gsub("-", " "))
      item
    end
  end
end
