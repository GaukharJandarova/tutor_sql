task spec: ["learn:db:test:prepare"]

namespace :learn do

  namespace :db do |ns|

    task :drop do
      Rake::Task["db:drop"].invoke
    end

    task :create do
      Rake::Task["db:create"].invoke
    end

    task :setup do
      Rake::Task["db:setup"].invoke
    end

    task :migrate do
      Rake::Task["db:migrate"].invoke
    end

    task :rollback do
      Rake::Task["db:rollback"].invoke
    end

    task :seed do
      Rake::Task["db:seed"].invoke
    end

    task :version do
      Rake::Task["db:version"].invoke
    end

    namespace :schema do
      task :load do
        Rake::Task["db:schema:load"].invoke
      end

      task :dump do
        Rake::Task["db:schema:dump"].invoke
      end
    end

    namespace :test do
      task :prepare do
        Rake::Task["db:test:prepare"].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ["learn:set_custom_config"] do
        Rake::Task["learn:revert_to_original_config"].invoke
      end
    end
  end

  task :set_custom_config do
    # save current vars
    @original_config = {
      env_schema: ENV['SCHEMA'],
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    ENV['SCHEMA'] = "db_learn/schema.rb"
    Rails.application.config.paths['db'] = ["db_learn"]
    Rails.application.config.paths['db/migrate'] = ["db_learn/migrate"]
    Rails.application.config.paths['db/seeds'] = ["db_learn/seeds.rb"]
    Rails.application.config.paths['config/database'] = ["config/database_learn.yml"]
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end
end