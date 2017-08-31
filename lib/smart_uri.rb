require "smart_uri/version"
require "smart_uri/uri"

module SmartURI
  def self.join(*args, **options)
    ::SmartURI::URI.join(*args, **options)
  end

  def self.parse(*args, **options)
    ::SmartURI::URI.parse(*args, **options)
  end
end
