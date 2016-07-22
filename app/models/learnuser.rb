# ActiveRecord::Base.establish_connection(
#   adapter:  'sqlite3',
#   database: 'db/learn.sqlite3'
# )

class Learnuser < ActiveRecord::Base  
    establish_connection DB_LEARN
end
