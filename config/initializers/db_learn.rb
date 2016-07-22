# save learn database settings in global var
DB_LEARN = YAML::load(ERB.new(File.read(Rails.root.join("config","database_learn.yml"))).result)[Rails.env]