
public class HappyFace extends FaceGroup
{
  public HappyFace(String id) {
    super(id);
    PShape s = createShape(ELLIPSE,70,-40, 145, 158);
    s.setFill(color(255, 244, 201));
    s.setStroke(color(255, 255, 255)); 
    shape.addChild(s);
    
      PShape h = createShape(ARC,70, -30, 200, 200, PI, TWO_PI-PI/180);
    //arc(0, height/9+movey, wb, hb, PI, TWO_PI-PI/180);
    h.setFill(color(28, 25, 25));
    h.setStroke(color(255, 255, 255)); 
    shape.addChild(h);
    
    
  }
}


public class HappyEye extends AnimatedFeature
{
   public HappyEye(String id, int x, int y) {
     super(id,x,y);
     open();
   }

   public PShape open() {
    shape = createShape(ELLIPSE,x, y, 20, 20);
    shape.setFill(color(0));
    shape.setStroke(color(0));
    return super.open();
    
  } 

  public PShape close() {
    shape = createShape(LINE,x-10,y+2,x+10,y+2);
    shape.setFill(color(0));
    shape.setStrokeWeight(4);
    shape.setStroke(color(0));
    return super.close();
  }  
}


public class HappyMouth extends AnimatedFeature
{  
   public HappyMouth(String id, int x, int y) {
     super(id,x,y);
     open();
   }
  
   public PShape open() {
     

    shape = createShape(ARC,x+70, y+25, 52, 10, 1, 180);
    shape.setFill(color(0));
    shape.setStroke(color(0));
    return super.open();
     
     //arc(207, 175, 52, 10, 1, 180);
     
    
  } 

  public PShape close() {
    shape = createShape(LINE,x+50,y+25,x+90,y+25);
    //shape = createShape(LINE,x+25,y+50,x+75,y+50);
    shape.setFill(color(0));
    shape.setStrokeWeight(4);
    shape.setStroke(color(0));
    return super.close();
  } 
}


public class AvatarFace
{
    HappyEye ojoIzq;
    HappyEye ojoDer;
  HappyMouth boca;
   HappyFace cara;
  
  public AvatarFace()
  {
    ojoIzq = new HappyEye("ojoIzq",   40, 0);
    ojoDer = new HappyEye("ojoDer", 100, 0);
      boca = new HappyMouth("boca",   0, 0);
      cara = new HappyFace("puppet");  
    cara.add(ojoIzq);
    cara.add(ojoDer);
    cara.add(boca);
  }

  public void draw(int x, int y) {
    cara.position(x,y);
    cara.draw();
  }

  public BasicState status(FeatureID id) {
    if (id == FeatureID.LeftEye) {
        return ojoIzq.status();
    } else if (id == FeatureID.RightEye) {
        return ojoDer.status();      
    }
    return BasicState.Undefined;
  }
   
  public void change(FeatureID id, Action action)
  {
    // PS BUG no-enum-switch 
    if (id == FeatureID.LeftEye) { // ojo izq?
      if (action == Action.closeEye) {
          cara.replaceShape(ojoIzq.getID(),ojoIzq.close());
      } else {
          cara.replaceShape(ojoIzq.getID(),ojoIzq.open());
      }
    } else if (id == FeatureID.RightEye) { // ojo der?
      if (action == Action.closeEye) {
          cara.replaceShape(ojoDer.getID(),ojoDer.close());
      } else {
          cara.replaceShape(ojoDer.getID(),ojoDer.open());
      } // if close
    } else if (id == FeatureID.Mouth) { // boca?
      if (action == Action.closeMouth) {
          cara.replaceShape(boca.getID(),boca.close());
      } else {
          cara.replaceShape(boca.getID(),boca.open());
      } // if close
    } // else
  } // change()
} // AvatarFace class
