module XdeltaMerger
  module Entities
    module Files
      class BasicFileCreator

        def initialize(url)
          @name  = extract_name_from_url(url)
          @content = build_content(url)
        end

        def build
          params = {
            :name => @name,
            :content => @content
          }
          basic_file_class.new(params)
        end

        private

        def basic_file_class
          ::XdeltaMerger::Entities::Files::BasicFile
        end

        def extract_name_from_url(url)
          uri = URI.parse(url)
          File.basename(uri.path)
        end

        def build_content(url)
          ::XdeltaMerger::Entities::Files::Contents::MemoryBasedContent.new(url)
        end

      end
    end
  end
end