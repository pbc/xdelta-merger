require "spec_helper"

describe XdeltaMerger::Entities::Files::Contents::MemoryBasedContent do
  let(:instance) { XdeltaMerger::Entities::Files::Contents::MemoryBasedContent.new(source_url) }
  let(:source_url) { "" }

  let(:file_1_content) { "this is file_1_content" }
  let(:file_1_url) { "http://www.example.com/?file_id=1" }

  it { instance.should respond_to :source_url }
  it { instance.should respond_to :raw_content }

  def load_content(url)
    open(url) {|f| f.read }
  end

  before do
    stub_http_request(:get, "www.example.com").with(
      :query => {"file_id" => "1"}
    ).to_return({:body => file_1_content})
  end

  context "#reload_from_source" do
    context "target is a local file" do
      let(:source_url) { File.join(Fixtures::FIXTURES_ROOT_DIR,"file_list.yml").to_s }

      it "reloads raw content correctly" do
        instance.reload_from_source
        expect(instance.raw_content).to eq load_content(source_url)
      end
    end

    context "target is a remote file" do
      let(:source_url) { file_1_url }

      it "reloads raw content correctly" do
        instance.reload_from_source
        expect(instance.raw_content).to eq load_content(file_1_url)
      end
    end
  end
end
