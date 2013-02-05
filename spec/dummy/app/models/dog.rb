class Dog
  include Mongoid::Document

  def self.slug_source
    :moniker
  end

  include Popolo::Sluggable
end