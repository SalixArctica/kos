
set rightSideOffset to 26.
set tabOffset to 2.

set topRow to 1.
set bottomRow to 5.

function initUI {
  clearscreen.

  set terminal:width to 50.
  set terminal:height to 7.
  set terminal:charheight to 24.
  print_grid().
}

function beginTimeUpdater {

  set launchTime to timespan(time():seconds).
  set lastTime to time():seconds.
  updateTime(0).

  on (time:seconds - lastTime > 1) {
    set lastTime to time():seconds.
    updateTime(round((time:seconds - launchTime):seconds, 0)).
    return true.
  }
}

function updateTime {
  parameter newTime.
  print "                       " at (rightSideOffset, bottomRow).
  print "T+" + newTime at (rightSideOffset + tabOffset, bottomRow).
}

function updateUI {

  parameter state.
  parameter next.
  parameter varName.
  parameter varVal.

  updateState(state, next).

  
}

function updateState {
  // clear area
  print "                        " at (0, topRow).

  // update
  parameter state.
  parameter next.

  print "State: " + state at (tabOffset, topRow).
  updateNext(next).
}

function updateNext {
  parameter next.
  print "                       " at (0, bottomRow).
  print "Next: " + next at (tabOffset, bottomRow).
}

function countdown {

  updateUI("Countdown", "Launch", "", "").

  SET V0 TO GETVOICE(0).

  FROM {local countdownTime is 5.} UNTIL countdownTime = 0 STEP {SET countdownTime to countdownTime - 1.} DO {
    
      PRINT "T-" + countdownTime at (30, 5).
      V0:PLAY( NOTE(400, .1) ). // beep
      WAIT 1.
  }

  beginTimeUpdater().
  V0:PLAY( NOTE(500, .3) ). // beeeeeeeep
}

function print_grid {
  print "|" at (25, 0).
  print "|" at (25, 1).
  print "|" at (25, 2).
  print "|" at (25, 3).
  print "|" at (25, 4).
  print "|" at (25, 5).
  print "|" at (25, 6).
  print "==================================================" at (0, 3).
}

function updateVar {
  parameter varName.
  parameter varValue.

  print "                        " at (rightSideOffset, topRow).
  print varName + ": " + varValue at (rightSideOffset + tabOffset, topRow).
}