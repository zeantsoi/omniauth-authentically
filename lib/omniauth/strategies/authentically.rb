require 'omniauth-oauth'

module OmniAuth
	module Strategies
		class Authentically < OmniAuth::Strategies::OAuth

      option :name, 'authentically'
      option :client_options, {
      	:site => 'http://authentically.heroku.com',
      	:authorize_path => '/oauth/authorize'#,
      	#:token_path => '/oauth/access_token'
      }

      uid { raw_info['id'] }

      info do
        {
        	"email" => raw_info['email'],
					'image' => raw_info['image'],
					'first_name' => raw_info['first_name'],
					'last_name' => raw_info['last_name'],
        	'level' => raw_info['level']
        }
      end

      extra do
        { :raw_info => raw_info }
      end


#			option :client_options, {
#				:site => 'http://localhost:3000',
#				:authorize_url => 'oauth/authorize',
#				:token_url => '/oauth/access_token'
#			}
			
#      info do
#      	{
#      		:name => raw_info['email']
#      	}
#      end

#			extra do
#				{
#					:raw_info => raw_info 
#				} 
#			end     

			def raw_info
				#@raw_info ||= access_token.params['coincoin']
				@raw_info ||= MultiJson.decode(access_token.get("/api/v1/users.json?token=#{access_token.params[:oauth_token]}").body) # ZT: figure out how to query the api without using the token
				#MultiJson.decode(access_token.get(url).body)
        #MultiJson.decode(access_token.get("/v1/people/~:(#{options.fields.join(',')})?format=json").body
			end

		end
	end
end
