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
  	
	webserver = Net::Telnet::new('Host' => 'localhost',
	                             'Port' => 4001,
	                             'Telnetmode' => false)

	webserver.puts(texto)

	webserver.waitfor(/\n/) do |txt|
  		return txt
	end
  end

end
