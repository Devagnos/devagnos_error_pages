module DevagnosErrorPages
  class RaisesController < ApplicationController

    before_filter :authenticate

    DevagnosErrorPages::Engine.config.error_codes.each do |error_code|
      error_code = error_code.to_i
      define_method "error_#{error_code}" do

        status = Rack::Utils::SYMBOL_TO_STATUS_CODE.detect { |status, code| code == error_code }
        status = status.first

        error_class = if status == :internal_server_error
          ['RuntimeError', :internal_server_error]
        else
          ActionDispatch::ExceptionWrapper.rescue_responses.detect { |error_class, _status| _status == status }
        end

        if error_class
          error_class = error_class.first.constantize

          case error_class.method(:new).arity
          when 0
            raise error_class.new
          when 1, -1
            raise error_class.new("test error #{error_code}")
          end
        end

        raise "unable to generate error #{status}"

      end
    end

    private

    def authenticate
      if DevagnosErrorPages::Engine.config.error_http_digest_username && DevagnosErrorPages::Engine.config.error_http_digest_password
        authenticate_or_request_with_http_digest do |username|
          if username == DevagnosErrorPages::Engine.config.error_http_digest_username
            DevagnosErrorPages::Engine.config.error_http_digest_password
          end
        end
      end
    end

  end
end