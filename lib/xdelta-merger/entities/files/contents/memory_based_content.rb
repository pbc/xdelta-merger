module XdeltaMerger
  module Entities
    module Files
      module Contents
        class MemoryBasedContent

          attr_reader :source_url
          attr_reader :raw_content

          def initialize(source_url)
            @source_url = source_url
            @raw_content = nil
          end

          def reload_from_source
            result = open(@source_url) {|f| f.read }
            @raw_content = result if result.is_a?(String)
          end

        end
      end
    end
  end
end