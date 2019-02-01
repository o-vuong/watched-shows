require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end



use Rack::MethodOverride
use Rack::Session::Cookie
run ApplicationController
use SessionsController
use ShowsWatchedController
use UsersController
