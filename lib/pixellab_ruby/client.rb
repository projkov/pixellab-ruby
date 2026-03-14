# frozen_string_literal: true

require_relative 'request'

module PixellabRuby
  # Client class for interacting with the Pixellab API
  class Client
    AVAILABLE_ROUTES = {
      generate_image_pixflux: '/generate-image-pixflux',
      get_balance: '/balance'
    }.freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def generate_image_pixflux(description, image_size)
      request = PixellabRuby::Request.new(@api_key, AVAILABLE_ROUTES[:generate_image_pixflux])
      request.post(
        {
          description: description,
          image_size: image_size
        }
      )
    end

    # def animate_with_text(
    #   action,
    #   description,
    #   image_size,
    #   reference_image,
    #   color_image,
    #   direction,
    #   image_guidance_scale,
    #   init_image_strength,
    #   init_images,
    #   inpainting_images,
    #   mask_images,
    #   n_frames
    # )
    #
    # end

    def get_balance # rubocop:disable Naming/AccessorMethodName
      request = PixellabRuby::Request.new(@api_key, AVAILABLE_ROUTES[:get_balance])
      request.get
    end
  end
end
