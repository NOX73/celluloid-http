class Celluloid::Http::Builder

  class<<self

    def get(url)
      Celluloid::Http::Request.new url
    end

    def post(url, params)
      options = {
          form_data: params,
          method: :post
      }
      Celluloid::Http::Request.new url, options
    end

  end

end
