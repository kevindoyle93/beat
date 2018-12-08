import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer tune;
AudioPlayer ticks;

int targetBeat;

int BPM = 60;

boolean listening;

void setup() {
  size(600, 800);
  background(255, 240, 230);
  board = new Board(width, 150, 8);
  gamebar = new Gamebar(150, 120, 1024, board);
  
  listening = true;
  
  minim = new Minim(this);
  tune = minim.loadFile("audio/60.wav");
  ticks = minim.loadFile("audio/60.wav");
  tune.play();
  
  targetBeat = int(((float(60) / float(BPM)) * 3) * 1000);
}

Board board;
Gamebar gamebar;
int startTime;

void draw() {
  gamebar.draw();
  board.draw();
  board.playerListening = listening;
  
  if (tune.isPlaying()){
    listening = true;
  }
  
  if (listening && !tune.isPlaying()) {
    ticks.play(0);
    startTime = millis();
    print("ticks has started");
    listening = false;
  }
  
  if (!listening && !ticks.isPlaying()) {
    tune.play(0);
    listening = true;
  } //<>//
  
  if (ticks.isPlaying()) {
    if (millis() > targetBeat + startTime) {
      board.beatMatcher.onBeatHit();
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
    board.beatMatch();
  }
}
