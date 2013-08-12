require 'yaml'

yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'authentication.yml'))).result)
AUTH = HashWithIndifferentAccess.new(yaml_data)
