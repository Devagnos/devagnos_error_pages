module ActionDispatch::Routing
  class Mapper
    
    def define_fallback_to(to)
      except = if Rails.env.production?
        %w(health_check/ raises/)
      else
        %w(health_check/ raises/ rails/)
      end
      get '*a', :to => to, :constraints => {:a => %r{(?!#{except.join('|')}).*}}
    end
    
  end
end