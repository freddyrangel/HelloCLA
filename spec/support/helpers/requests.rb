module Helpers
  module Requests
    def mime_json
      { 'Accept' => Mime::JSON.to_s, 'Content-Type' => Mime::JSON.to_s }
    end
  end
end
