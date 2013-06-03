require "spec_helper"

describe XdeltaMerger::Entities::Files::VersionedFileCreator do
  let(:instance) {
    XdeltaMerger::Entities::Files::VersionedFileCreator.new(urls)
  }

  let(:versioned_file_class) { XdeltaMerger::Entities::Files::VersionedFile }
  let(:basic_file_class) { XdeltaMerger::Entities::Files::VersionedFile }
  let(:fake_basic_file_class) { stub({}) }

  let(:urls) {
    [ source_url, patch_1_url, patch_2_url ]
  }

  let(:source_url) {"http://example.com/source.txt?some_params=[]&other=[]"}

  let(:patch_1_url) {"http://example.com/patch1.txt?some_params=[]&other=[]"}
  let(:patch_2_url) {"http://example.com/patch2.txt?some_params=[]&other=[]"}

  context ".build" do
    let(:created_object) { instance.build }

    it "returns correct object" do
      expect(created_object).to be_an_instance_of(versioned_file_class)
    end

    it "creates an object with a correct content" do
      fake_basic_file_class.should_receive(:new).with(
        {:url => source_url}
      ).and_return("source")

      fake_basic_file_class.should_receive(:new).with(
        {:url => patch_1_url}
      ).and_return("patch 1")

      fake_basic_file_class.should_receive(:new).with(
        {:url => patch_2_url}
      ).and_return("patch 2")

      instance.stub(:basic_file_class => fake_basic_file_class)

      versioned_file_class.should_receive(:new).with(
        "source", ["patch 1", "patch 2"]
      ).and_return("correct content")

      instance.build()
    end
  end
end
