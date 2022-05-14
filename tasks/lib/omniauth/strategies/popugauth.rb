require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Popugauth < OmniAuth::Strategies::OAuth2
      option :name, :popugauth

      option :client_options,
             site: 'http://localhost:3000',
             authorize_path: "/oauth/authorize"

      uid do
        raw_info["id"]
      end

      info do
        {
          email: raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/users/current").parsed
      end
    end
  end
end