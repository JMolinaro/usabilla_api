module UsabillaApi
  module Models
    module Email
      module Feedback
        class Item
          attr_accessor :id, :user_agent, :comment, :location, :date, :custom, :email, :labels, :nps,
                        :public_url, :rating, :button_id, :tags, :url

          def initialize(args = {})
            @id             = args['id']          || ''
            @user_agent     = args['userAgent']   || ''
            @comment        = args['comment']     || ''
            @location       = args['location']    || ''
            @date           = args['date']        || nil
            @custom         = args['custom']      || []
            @email          = args['email']       || ''
            @labels         = args['labels']      || []
            @nps            = args['nps']         || nil
            @public_url     = args['publicUrl']   || ''
            @rating         = args['rating']      || nil
            @button_id      = args['buttonId']    || ''
            @tags           = args['tags']        || []
            @url            = args['url']         || ''
          end
        end
      end
    end
  end
end