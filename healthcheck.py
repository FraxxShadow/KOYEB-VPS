from http.server import BaseHTTPRequestHandler, HTTPServer

class AlwaysOKHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"OK")

    def log_message(self, format, *args):
        return  # Silence logs

if __name__ == '__main__':
    server = HTTPServer(('', 8080), AlwaysOKHandler)
    print("Healthcheck server running on port 8080...")
    server.serve_forever()
