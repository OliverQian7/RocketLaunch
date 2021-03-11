public class Rocket extends Entity {
 public PVector vel, force;
 public boolean active = true;
  
 public Rocket(int x, int y) {
   super(#00FFFF, 10, 30, x,y);
   float angle = random(PI * 1.3, PI * 1.7);
   vel = PVector.fromAngle(angle);
   force = PVector.fromAngle(angle);
 }
 
 public void move() {
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
  
   private void rocketVsObstacle(Obstacle o) {
    if (this.getCollisionBox().intersects(o.getCollisionBoxes()[0])
    ||this.getCollisionBox().intersects(o.getCollisionBoxes()[1])) {
      this.active = false;
    }
  }
}