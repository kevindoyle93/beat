import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer loop;
BeatDetect beatDetect;
BeatListener beatListener;
int BPM = 60;

void setup() {
  size(600, 600);
  background(200);
  
  minim = new Minim(this);
  loop = minim.loadFile("audio/60.wav");
  loop.loop();
  beatDetect = new BeatDetect(loop.bufferSize(), loop.sampleRate());
  beatDetect.setSensitivity(530);
  beatListener = new BeatListener(beatDetect, loop);
}

Board board = new Board(600, 8);

void draw() {  
  board.draw();
  
  beatDetect.detect(loop.mix);
  if (beatDetect.isKick()) {
    println("kick");
  } else if (beatDetect.isSnare()) {
    println("snare");
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      board.movePlayer(Direction._UP);
    } else if (keyCode == DOWN) {
      board.movePlayer(Direction._DOWN);
    } else if (keyCode == LEFT) {
      board.movePlayer(Direction._LEFT);
    } else if (keyCode == RIGHT) {
      board.movePlayer(Direction._RIGHT);
    } else if (keyCode == ENTER) {
      // perform beat matching
      board.beatMatch();
    }
  }
}
