class PantallaCarga{
  int p=0;
  
  PantallaCarga(){}
  
  void cambio(){
    if (p == 0)
    pan1();
    
   
  }
    void pan1(){
  
      
      fill(255,0,0);
      stroke(255,0,0);
      ellipse(300,550,50,50);
      
      
  //titulo
  fill(255,0,0);
  textSize(50);
  text("SHIP",260,50);
   textSize(30);
  text("Simulación",60,550);
  textSize (15);
  text("*No crear mas de 3 barquitos",60,580);
  textSize(30);
  fill(0);
  text("click",270,560);


       if(keyPressed)
      if(key=='1')
      p++;
      
      
    }
    

 
      
    
    }
    

    
