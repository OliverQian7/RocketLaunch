public class Obstacle extends Entity{
  public Obstacle(int x, int y) {
    super(#FFFFFF,50,5,x,y);
  }
  
  public void draw() {
   fill(c);
   rect(0,this.pos.y, this.pos.x, this.h);
   rect(this.pos.x + this.w, this.pos.y, width, this.h); 
  }
  
  public Rectangle[] getCollisionBoxes() {
   Rectangle[] boxes = new Rectangle [2]; 
   boxes [0] = new Rectangle(0,(int)this.pos.y, (int)this.pos.x, this.h);
   boxes [1] = new Rectangle((int)this.pos.x + this.w, (int)this.pos.y, width, this.h); 
   return boxes;
  }
}
