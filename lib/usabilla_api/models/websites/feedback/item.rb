module UsabillaApi
  module Models
    module Websites
      module Feedback
        class Item
          attr_accessor :id, :user_agent, :comment, :location, :date, :custom,
                        :email, :image, :labels, :nps, :public_url, :rating,
                        :button_id, :tags, :url, :raw_data

          def initialize(args = {})
            @raw_data       = args.with_indifferent_access
            @id             = raw_data['id']          || ''
            @user_agent     = raw_data['userAgent']   || ''
            @comment        = raw_data['comment']     || ''
            @location       = raw_data['location']    || ''
            @date           = raw_data['date']        || ''
            @custom         = raw_data['custom']      || {}
            @email          = raw_data['email']       || ''
            @image          = raw_data['image']       || ''
            @labels         = raw_data['labels']      || []
            @nps            = raw_data['nps']         || nil
            @public_url     = raw_data['publicUrl']   || []
            @rating         = raw_data['rating']      || ''
            @button_id      = raw_data['buttonId']    || nil
            @tags           = raw_data['tags']        || []
            @url            = raw_data['url']         || ''
          end

        end
      end
    end
  end
end
