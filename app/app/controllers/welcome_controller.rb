require 'net/telnet'

class WelcomeController < ApplicationController
  def index
  	 @respuesta = false;
	 if request.post?
	    @comentario = {
	        :texto => params[:texto],
	    };
	    @comentario[:texto] = telnetServer(@comentario[:texto])
	 end
  end

  def telnetServer(texto)

  	respuesta=''
	webserver = Net::Telnet::new('Host' => 'localhost',
	                             'Port' => 4001
	                             )

	webserver.puts(texto)

	webserver.waitfor(/\n/) do |txt|
		respuesta = respuesta << txt
	end

	return respuesta

  end

end
