module XdeltaMerger
  module Entities
    module Files
      class BasicFile

        attr_reader :content
        attr_reader :name

        def initialize(options)
          @name = options[:name]
          @content = options[:content]
        end

      end
    end
  end
end