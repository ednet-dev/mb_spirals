import 'dart:html';

// s00.s00

class Mb {

  Mb() {
  }

  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.querySelector('#status').innerHtml = message;
  }
}

void main() {
  new Mb().run();
}
