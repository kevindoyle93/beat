import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer loop;

int BPM = 60;

void setup() {
  size(600, 600);
  background(200);
  
  minim = new Minim(this);
  loop = minim.loadFile("audio/60.wav");
  loop.loop();
  
  for (int i = 0; i < numTries; i++) {
    dones.add(false);
  }
}

Board board = new Board(600, 8);

boolean done1, done2, done3 = false;
ArrayList<Boolean> dones = new ArrayList();
int numTries = 10;
void draw() {
  
  board.draw();
  
  for (int i = 1; i <= numTries; i++) {
    if (!dones.get(i - 1) && millis() > 3000 * i) {
      matchBeatMock();
      dones.set(i - 1, true);
    }
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
    }
  } else if (key == ENTER) {
    // perform beat matching
    board.beatMatch();
  }
}

void matchBeatMock() {
  board.beatMatcher.onBeatHit();
}
