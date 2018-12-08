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
  gamebar = new Gamebar(150, 120, board);
  
  listening = true;
  
  minim = new Minim(this);
  loadSongs();
  tune.play();
  
  targetBeat = int(((float(60) / float(BPM)) * 3) * 1000);
}

Board board;
Gamebar gamebar;
int startTime;

boolean hittable = false;
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
    hittable = true;
  }
  
  if (!listening && !ticks.isPlaying()) {
    tune.play(0);
    listening = true;
  } //<>//
  
  targetBeat = ((60 / BPM) * 3) * 1000;
  
  if (ticks.isPlaying()) {
    if (hittable && millis() > targetBeat + startTime) {
      board.beatMatcher.onBeatHit();
      hittable = false;
    }
  }
  
}

void loadSongs() {
  tune = minim.loadFile("audio/" + BPM + ".wav");
  ticks = minim.loadFile("audio/" + BPM + ".wav");
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
