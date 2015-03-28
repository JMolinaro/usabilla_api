module UsabillaApi
  module Models
    module Feedback
      class Item
        attr_accessor :id, :user_agent, :comment, :location, :date, :custom, :email, :image, :labels, :nps, :public_url, :rating, :button_id, :tags, :url

        def initialize(args = {})
          @id             = args['id'] || ''
          @user_agent     = args['userAgent'] || ''
          @comment        = args['comment'] || ''
          @location       = args['location'] || ''
          @date           = args['date'] || ''
          @custom         = args['custom'] || []
          @email          = args['email'] || ''
          @image          = args['image'] || ''
          @labels         = args['labels'] || []
          @nps            = args['nps'] || nil
          @public_url     = args['publicUrl'] || []
          @rating         = args['rating'] || ''
          @button_id      = args['buttonId'] || nil
          @tags           = args['tags'] || []
          @url            = args['url'] || ''
        end

      end
    end
  end
end