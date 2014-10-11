// globals
// number, circle number
long n=1, cno = 1, pcno=0;
// screen middle point x, y
long midX=400, midY=300;
float scale=0.5;

void setup() {
  size(800, 600);
  fill(255, 255, 255, 100);
  noStroke();
  background(0);
}

void draw() {
  for(int i=0; i<100; i++){
    drawOne();
  }
}

void drawOne() {
  long px=0, py=0;
  // circle pointer
  long cp = n-1 - pcno*pcno;
  // side number
  long sno = cp / (pcno+1);
  // side pointer
  long sp = cp % (pcno+1);
  switch((int) sno) {
    case 0:
    px = (cno/2);
    py = (pcno/2)-sp;
    break;
    case 1:
    px = (pcno/2)-sp;
    py = -(cno/2);
    break;
    case 2:
    px = -(cno/2);
    py = -(pcno/2)+sp;
    break;
    case 3:
    px = -(pcno/2)+sp;
    py = (cno/2);
  }
  // println("n="+n+", pcno="+pcno+", cno="+cno+", cp="+cp+", sno="+sno+", sp="+sp+", px="+px+", py="+py);
  if(isPrime(n))
    rect(midX + px*scale, midY + py*scale, 1, 1);
  n = n + 1;
  if(n > cno*cno) {
    pcno = cno;
    cno += 2;
  }
}

boolean isPrime(long n) {
  for(long i=2; i<n-1; i++) {
    if(n % i == 0) return false;
  }
  return true;
}
