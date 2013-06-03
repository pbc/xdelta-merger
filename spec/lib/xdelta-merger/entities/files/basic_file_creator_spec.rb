require "spec_helper"

describe XdeltaMerger::Entities::Files::BasicFileCreator do
  let(:instance) {
    XdeltaMerger::Entities::Files::BasicFileCreator.new(url)
  }

  let(:url) {"http://example.com/#{filename}?some_params=[]&other=[]"}
  let(:filename) { "foobar.txt" }

  context ".build" do
    let(:created_object) { instance.build }

    it "creates correct object" do
      expect(created_object).to be_an_instance_of(XdeltaMerger::Entities::Files::BasicFile)
    end

    it "creates an object with a correct content" do
      ::XdeltaMerger::Entities::Files::Contents::
        MemoryBasedContent.should_receive(
          :new
        ).with(url).and_return("correct content")

      expect(created_object.content).to eq "correct content"
    end

    it "creates an object with a correct name" do
      expect(created_object.name).to eq filename
    end

  end
end
