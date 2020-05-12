
require './config/environment'
require './app/controllers/application_controller'

begin
  fi_check_migration

  use Rack::MethodOverride

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
