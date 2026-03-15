# frozen_string_literal: true

require 'base64'

module PixellabRuby
  # Image class for handling image data
  class Image
    attr_reader :data

    def initialize(data, name = 'output', output_folder = 'output')
      @data = data
      @name = name
      @output_folder = output_folder
    end

    def to_image
      file_path = File.join(@output_folder, "#{@name}.png")
      File.open(file_path, 'wb') { |f| f.write(Base64.decode64(@data)) }
    end
  end
end
