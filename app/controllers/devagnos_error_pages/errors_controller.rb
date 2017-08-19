module DevagnosErrorPages
  class ErrorsController < ApplicationController

    # @exception  = env['action_dispatch.exception']
    # @status     = ActionDispatch::ExceptionWrapper.new(env, @exception).status_code
    # @response   = ActionDispatch::ExceptionWrapper.rescue_responses[@exception.class.name]

    DevagnosErrorPages::Engine.config.error_codes.each do |error_code|
      define_method "error_#{error_code}" do
        _render = lambda { render("error_pages/#{error_code}", :status => error_code) }
        if (format = DevagnosErrorPages::Engine.config.error_controller_with_format)
          with_format format, &_render
        else
          _render.call
        end
      end
    end

    private

    def with_format(format)
      old_formats   = self.formats
      self.formats  = [format]
      yield
    ensure
      self.formats  = old_formats
    end

  end
end