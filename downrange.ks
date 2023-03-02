//hellolaunch

//First, we'll clear the terminal screen to make it look nice
CLEARSCREEN.

run ui.

function main {
  initUI().
  countdown().
  launch().
  gravityTurn().
  stage2().
  finalStage().
}

main().

function launch {
  lock throttle to 1.0.
  stage.
  updateState("Firing", "Release").

  wait 2.5.
  stage.
  updateState("Releasing", "Gravity Turn").

  wait 5.

}

function gravityTurn {
  set targetAngle to 55.
  set totalSteeringTime to 50.
  updateState("Turning", "Stage").

  FROM {local steeringTime is 0.} until steeringTime = totalSteeringTime step {set steeringTime to steeringTime + .5.} Do {
    
    set angle to 90 - (steeringTime / totalSteeringTime) * targetAngle.
    lock steering to heading(90, angle).
    updateVar("angle", Round(angle) + "°").
    wait .5.
  }

}

function stage2 {

  wait until ship:thrust = 0.
  stage.
  updateState("Stage 2", "Final Stage").

  wait 5.
}

function finalStage {
  wait until ship:thrust = 0.
  stage.
  updateState("Final Stage", "...").
}

wait 200.
