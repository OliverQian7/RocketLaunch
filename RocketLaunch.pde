ArrayList<Rocket> rockets = new ArrayList();
Obstacle[] obstacles = new Obstacle[5];

public void setup() {
  size(300, 900); 
  spawnObstacles();
}

public void draw() {
  background(0); 

  for (Obstacle o : obstacles) {
    o.draw();
  }

  for (Rocket rocket : rockets) {
    if (rocket != null && rocket.active) {
      rocket.draw();
      for (Obstacle o : obstacles) rocket.rocketVsObstacle(o);
      rocket.move();
      rocket.rocketVsBorder();
    }
  }
  if (rockets.size() > 0 && allRocketsDestroyed()) {
    Rocket best = bestRocket();
    spawnNextGenRockets(best);
  }
}

public void spawnNextGenRockets(Rocket best) {
  for (int i = 0; i < rockets.size(); i++) {
    rockets.set(i, new Rocket(width/2, height-10, best.brain));
  }
}

public boolean allRocketsDestroyed() {
  for (int i = 0; i < rockets.size(); i++) {
    if (rockets.get(i).active == true) {
      return false;
    }
  }
  return true;
}

public Rocket bestRocket() {
  int index = -1;
  float h = 100000000;
  float x = 100000000;
  for (int i = 0; i < rockets.size(); i++) {
    if (rockets.get(i).pos.y <= h) {
      h = rockets.get(i).pos.y;
      if (abs(obstacles[rockets.get(i).nextObstacleint].pos.x - rockets.get(i).pos.x) < x) {
        index = i; 
        x = abs(obstacles[rockets.get(i).nextObstacleint].pos.x - rockets.get(i).pos.x);
      }
    }
  }
  return rockets.get(index);
  //return h;
}

public void mouseReleased() {
  for (int i = 0; i < 20; i++) {
    rockets.add(new Rocket(mouseX, mouseY));
  }
}

private void spawnObstacles() {
  for (int i = 0; i < obstacles.length; i++) {
    int x = (int) map(random(1), 0, 1, width *.1, width*.9);
    int y = (int) (map(i, 0, 5, 600, 0));
    obstacles[i] = new Obstacle(x, y);
  }
}
