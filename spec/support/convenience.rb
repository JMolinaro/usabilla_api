module UsabillaApi
  module SpecSupport
    module Convenience

      def anything
        /.*/
      end

      def uri_stem(uri_stem_to_match, replacement_id = nil)
        uri_stem_to_match.sub!(':id', replacement_id) if replacement_id
        /#{uri_stem_to_match}*/
      end

    end
  end
end