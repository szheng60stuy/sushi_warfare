class Slash{
  int index;
  PImage[] sheet;
  int update; 
  int x;
  int y;
  boolean done;
  
  Slash(int x, int y){
    this.x = x;
    this.y = y - 128;
    PImage slashSheet = loadImage("slash.png");
    sheet = new PImage[10];
    for (int i = 0; i < 10; i++){
      sheet[i] = slashSheet.get(144 * i, 0, 144, slashSheet.height);
    }
  }
  
  void draw(){
    image(sheet[index], x, y);
    if (!done){
      update = frameCount;
      index++;
      if (index == 9){
        done = true;
      }
    }
  }
}
