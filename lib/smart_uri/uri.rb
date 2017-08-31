require 'uri'

module SmartURI
  class URI < SimpleDelegator
    SEPARATOR = '/'.freeze

    def self.join(*paths, query:{})
      paths = paths.compact.reject(&:empty?)
      last = paths.length - 1
      url = paths.each_with_index.map { |path, index| _expand(path, index, last) }.join

      result = if query.length > 0
        url + "?#{::URI.encode_www_form(query.to_a)}"
      else
        url
      end

      new(result)
    end

    def self.parse(*args, **options)
      join(*args, **options)
    end

    def self._expand(path, current, last)
      if path.start_with?(SEPARATOR) && current != 0
        path = path[1..-1]
      end

      unless path.end_with?(SEPARATOR) || current == last
        path = [path, SEPARATOR]
      end

      path
    end

    def initialize(val)
      @obj = (val.is_a?(::String) ? ::URI.parse(val) : val)
    end

    def __getobj__
      @obj
    end

    def join(*paths, **options)
      self.class.join(*[self.to_s, paths].flatten, **options)
    end
  end
end
