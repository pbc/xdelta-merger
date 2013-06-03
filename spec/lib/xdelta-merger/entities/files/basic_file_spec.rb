require "spec_helper"

describe XdeltaMerger::Entities::Files::BasicFile do
  let(:instance) { XdeltaMerger::Entities::Files::BasicFile.new(file_options) }
  let(:file_options) { {} }


  it { instance.should respond_to :name }
  it { instance.should respond_to :content }

end
