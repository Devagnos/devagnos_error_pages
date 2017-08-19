module DevagnosErrorPages

  extend ActiveSupport::Autoload

  # autoload :Class

end

require 'devagnos_error_pages/railtie'
require 'devagnos_error_pages/engine'
require 'devagnos_error_pages/routes'

require 'health_check'