var telnet = require('telnet')

console.log('servidor corriendo')

telnet.createServer(function (client) {
  console.log('procesa mensaje')
  // listen for the actual data from the client
  client.on('data', function (b) {
 
	console.log(b.toString());
    client.write("mensaje recibido por el server: " + b)
  })
  

}).listen(4001)