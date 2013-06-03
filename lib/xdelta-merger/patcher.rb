module XdeltaMerger
  class Patcher
    def initialize(versioned_file)
      @versioned_file = versioned_file
    end

    def merge_in_patches
      apply_patches(@versioned_file.source_file, @versioned_file.patch_files)
    end

    def apply_patches(source_file, patches)
      patches.each do |patch_file|
        patch_file_contents(source_file, patch_file)
      end
    end

    def patch_file_contents(source_file, patch_file)
      # patch the source files's content
    end

  end
end
