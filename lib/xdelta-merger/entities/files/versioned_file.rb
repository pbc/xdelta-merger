module XdeltaMerger
  module Entities
    module Files
      class VersionedFile
        attr_reader :source_file
        attr_reader :patch_files

        def initialize(source_file, patch_files = [])
          @source_file = source_file
          @patch_files = patch_files
        end
      end
    end
  end
end