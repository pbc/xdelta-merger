module XdeltaMerger
  module Entities
    module Files
      class VersionedFileCreator

        def initialize(urls = [])
          @source_file_url = urls.first
          @patch_file_urls = urls[1..urls.length].to_a
        end

        def build
          source_file = create_basic_file(@source_file_url)
          patch_files = create_patch_files(@patch_file_urls)
          versioned_file_class.new(source_file,patch_files)
        end

        private

        def versioned_file_class
          ::XdeltaMerger::Entities::Files::VersionedFile
        end

        def basic_file_class
          ::XdeltaMerger::Entities::Files::BasicFile
        end

        def create_basic_file(url)
          basic_file_class.new({:url => url})
        end

        def create_patch_files(urls)
          urls.inject([]) do |result, url|
            result << create_basic_file(url)
          end
        end
      end
    end
  end
end