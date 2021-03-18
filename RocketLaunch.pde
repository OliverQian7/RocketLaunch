 ArrayList<Rocket> rockets = new ArrayList();
Obstacle[] obstacles = new Obstacle[5];

public void setup() {
 size(300,900); 
 spawnObstacles();
}

public void draw() {
 background(0); 
 
 for (Obstacle o : obstacles) {
   o.draw();
 }
 
 for (Rocket rocket: rockets) {
 if (rocket != null && rocket.active) {
   rocket.draw();
   for (Obstacle o : obstacles) rocket.rocketVsObstacle(o);
   rocket.move();
   rocket.rocketVsBorder();
 
 }
 }
}

public void mouseReleased() {
  for (int i = 0; i < 20; i++) {
  rockets.add(new Rocket(mouseX, mouseY));
  }
}

private void spawnObstacles() {
  for (int i = 0; i < obstacles.length; i++) {
    int x = (int) map(random(1), 0, 1, width *.1, width*.9);
    int y = (int) (map(i,0,5,600,0));
    obstacles[i] = new Obstacle(x, y);
  }
}
