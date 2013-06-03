require "spec_helper"

require "fixtures/file_fixtures"

describe XdeltaMerger::Patcher do
  let(:instance) { XdeltaMerger::Patcher.new(versioned_file) }
  let(:versioned_file) { stub({
    :source_file => source_file
  })}

  let(:source_file) {
    XdeltaMerger::Entities::Files::BasicFile.new(
      "http://example.com/source.txt"
    )
  }

end
