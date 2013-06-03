require "spec_helper"

describe XdeltaMerger::Entities::Files::VersionedFile do
  let(:instance) {
    XdeltaMerger::Entities::Files::VersionedFile.new(source_file,patch_files)
  }

  let(:source_file) {stub({})}
  let(:patch_files) {[]}


  it { instance.should respond_to :source_file }
  it { instance.should respond_to :patch_files }

  context "#initialize" do
    it "assigns correct source_file" do
      expect(instance.source_file).to eq(source_file)
    end

    it "assigns correct patch_files" do
      expect(instance.patch_files).to eq(patch_files)
    end
  end

end
