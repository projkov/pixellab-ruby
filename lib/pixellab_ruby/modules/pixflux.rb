# frozen_string_literal: true

module PixellabRuby
  class Client
    # Pixflux module to use pixflux endpoint.
    module Pixflux
      ARGS_AVAILABLE = [
        :description,
        :image_size,
        :color_image,
        :detail,
        :direction,
        :init_image,
        :init_image_strength,
        :isometric,
        :no_background,
        :outline,
        :seed,
        :shading,
        :text_guidance_scale,
        :view
      ].freeze
      ARGS_REQUIRED = [:description, :image_size]
      ARGS_DEFAULT_VALUES = {
        init_image_strength: 300,
        isometric: false,
        no_background: false,
        text_guidance_scale: 8
      }.freeze
      # Request model for pixflux image generation endpoint.
      #
      # @param description [String] (required) Text description of the image to generate.
      # @param image_size [Hash] (required) Image dimensions in pixels.
      #   @option image_size [Integer] :width (required) Image width in pixels (min: 16, max: 400).
      #   @option image_size [Integer] :height (required) Image height in pixels (min: 16, max: 400).
      # @param color_image [Hash, nil] (nullable) A base64 encoded image. Use +{ type: "base64", base64: "<data>" }+.
      # @param detail [String, nil] (nullable) Detail style reference (weakly guiding).
      # @param direction [String, nil] (nullable) Subject direction (weakly guiding).
      # @param init_image [Hash, nil] (nullable) A base64 encoded initial image. Use +{ type: "base64", base64: "<data>" }+.
      # @param init_image_strength [Integer, nil] (nullable) Strength of the initial image influence (min: 1, max: 999).
      # @param isometric [Boolean, nil] (nullable) Generate in isometric view (weakly guiding).
      # @param no_background [Boolean, nil] (nullable) Generate with transparent background (blank background over 200x200 area).
      # @param outline [String, nil] (nullable) Outline style reference (weakly guiding).
      # @param seed [Integer, nil] (nullable) Seed decides the starting noise.
      # @param shading [String, nil] (nullable) Shading style reference (weakly guiding).
      # @param text_guidance_scale [Numeric, nil] (nullable) How closely to follow the text description (min: 1, max: 20).
      # @param view [String, nil] (nullable) Camera view angle (weakly guiding).
      # @return [Object, nil] The generated image object, or +nil+ if generation failed or returned no image.
      def generate_image_pixflux(args)
        request = PixellabRuby::Request.new(@api_key, AVAILABLE_ROUTES[:generate_image_pixflux])
        payload = build_generate_image_pixflux_payload(args)
        Async { request.post(payload) }.wait
      end

      private

      def validate_args(args)

      end

      def args_may_present?(args)
        args.all?
      end

      def build_default_values(args)
        args.merge(ARGS_DEFAULT_VALUES)
      end

      def build_generate_image_pixflux_payload(args)
        build_default_values(args)
      end
    end
  end
end
