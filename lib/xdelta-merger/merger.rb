module XdeltaMerger
  class Merger
    def initialize(revision_sources)
      @revision_sources = revision_sources
    end

    def merge
      file = build_versioned_file
      patcher(file).merge_in_patches
      file
    end

    private

    def patcher(versioned_file)
      ::XdeltaMerger::Patcher.new(versioned_file)
    end

    def build_versioned_file
      ::XdeltaMerger::Entities::Files::VersionedFileCreator.new(@revision_sources).build
    end
  end
end
