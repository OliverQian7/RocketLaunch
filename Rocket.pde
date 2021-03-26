public class Rocket extends Entity {
 public PVector vel, force;
 public boolean active = true;
 public Brain brain;
 public Obstacle nextObstacle;
 public int nextObstacleint;
  
 public Rocket(int x, int y) {
   super(#00FFFF, 10, 30, x,y);
   float angle = random(PI * 1.3, PI * 1.7);
   vel = PVector.fromAngle(angle);
   force = PVector.fromAngle(angle).mult(0);
   brain = new Brain(this); 
   nextObstacle = obstacles[0];
 }
 
 public Rocket(int x, int y, Brain b) {
    super(#00FFFF, 10, 30, x, y);
    float angle = random(PI * 1.3, PI * 1.7);
    vel = PVector.fromAngle(angle);
    force = PVector.fromAngle(angle).mult(0);
    brain = new Brain(this, b);
    nextObstacle = obstacles[0];
 }
 
 public void move() {
   didPassObstacle();
  force = brain.pickDirection(nextObstacle);
  
  this.pos.add(vel);
  this.vel.add(force);
 }
 
 private void rocketVsBorder() {
    if (this.pos.x > width
      || this.pos.x < 0
      || this.pos.y > height)
    {
      this.active = false;
    }
  }
  
  private void didPassObstacle() {
   if (this.getCollisionBox().intersects(nextObstacle.getCollisionBox())){
     nextObstacleint++;
     nextObstacle = obstacles[nextObstacleint];
   }
  }
  
   private void rocketVsObstacle(Obstacle o) {
    if (this.getCollisionBox().intersects(o.getCollisionBoxes()[0])
    ||this.getCollisionBox().intersects(o.getCollisionBoxes()[1])) {
      this.active = false;
    }
  }
}
