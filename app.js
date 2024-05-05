const http = require('http');
const os = require('os');

const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.write(`Adres IP serwera: ${req.socket.localAddress}\n`);
  res.write(`Nazwa serwera (hostname): ${os.hostname()}\n`);
  res.write(`Wersja aplikacji: ${process.env.APP_VERSION}\n`);
  res.end();
});

server.listen(3000, () => {
  console.log('Aplikacja jest uruchomiona na porcie 8080');
});
