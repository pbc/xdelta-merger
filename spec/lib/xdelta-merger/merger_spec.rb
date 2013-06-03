require "spec_helper"

require "fixtures/file_fixtures"

describe XdeltaMerger::Merger do
  let(:klass) { XdeltaMerger::Merger }
  let(:instance) { XdeltaMerger::Merger.new(file_revision_sources) }

  let(:file_revision_sources) {FileFixtures::file_revision_sources}

  context "#initialize" do
    it "accepts sources as an Array" do
      expect { klass.new(file_revision_sources) }.not_to raise_error()
    end
  end

  context "#merge" do
    it "returns versioned file" do
      expect(instance.merge).to be_a(XdeltaMerger::Entities::Files::VersionedFile)
    end
  end

end
