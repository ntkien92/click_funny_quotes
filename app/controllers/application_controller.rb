class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def meta_tag(title, description)
      set_meta_tags title: title,
                    description: description,
                    og: {
                      url: 'http://0.0.0.0:3000/test',
                      title: title,
                      description: description,
                      type: 'website',
                    }
    end
end
