import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer loop;
int targetBeat;

int BPM = 60;

void setup() {
  size(600, 800);
  background(255, 240, 230);
  board = new Board(width, 150, 8);
  gamebar = new Gamebar(150, color(20,230,0), 120, 1024);
  
  minim = new Minim(this);
  loop = minim.loadFile("audio/60.wav");
  loop.loop();
  
  for (int i = 0; i < numTries; i++) {
    dones.add(false);
  }
}

Board board;
Gamebar gamebar;

ArrayList<Boolean> dones = new ArrayList();
int numTries = 10;
void draw() {
  gamebar.draw();
  board.draw();
  
  targetBeat = ((60 / BPM) * 3) * 1000;
  
  for (int i = 1; i <= numTries; i++) {
    if (!dones.get(i - 1) && millis() > targetBeat * i) {
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
