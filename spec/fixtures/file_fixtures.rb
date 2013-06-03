require "yaml"
class FileFixtures
  class << self
    def file_revision_sources
      list_file  = File.join(Fixtures::FIXTURES_ROOT_DIR,"file_list.yml")
      YAML::load_file(list_file)
    end
  end
end