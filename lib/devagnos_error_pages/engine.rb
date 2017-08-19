module DevagnosErrorPages
  class Engine < ::Rails::Engine

    isolate_namespace DevagnosErrorPages

    config.i18n.load_path += Dir[root.join('config/locales', '*.yml').to_s]

    # ActionDispatch::ExceptionWrapper.rescue_responses
    config.error_codes = %w(401 403 404 406 423 500)

    # TODO : 501 (ActionController::NotImplemented)
    # TODO : 422 (ActionController::InvalidAuthenticityToken)

    config.error_controller_with_format = :html

    config.error_http_digest_username = nil
    config.error_http_digest_password = nil

  end
end