DevagnosErrorPages::Engine.routes.draw do
  DevagnosErrorPages::Engine.config.error_codes.each do |error_code|
    match error_code, :to => "errors#error_#{error_code}", :via => :all
    match "raises/#{error_code}", :to => "raises#error_#{error_code}", :via => :all
  end
end

Rails.application.routes.draw do
  mount DevagnosErrorPages::Engine, :at => ''
end