import geometry;

point currentpoint = (0, 0);

coordsys R=currentcoordsys;

//path to(point s, point e, int out, int in) { //To Do!! right, left
  //len1 * (cos(out), sin(out))
  //len2 * (-cos(in), sin(in))
  //s + len1 * (cos(out), sin(out)) = e + len2 * (-cos(in), sin(in))
  //len2 * (-cos(in), sin(in)) - len1 * (cos(out), sin(out)) + e - s = 0
  //
  //return (1,1);
//}

//print
string string(point p) {
  return "(" + string(p.x) + "," + string(p.y) + ")";
}

void println(string s) {
  write(s+"\n");
}
void print(string s) {
  write(s);
}

void print(real s) {
  write(string(s));
}

void print(point s) {
  write(string(s));
}

//draw
void resetp() {
  currentpoint = (0, 0);
}

point t(point p) {
  currentpoint = p;
  return p;
}
point t(real px, real py) {
  return t((px, py));
}

point rl(point p) { //as PGF "+(,)"
  return currentpoint + p;
}
point rl(real px, real py) {
  return rl((px, py));
}

point rlp(point p) { //as PGF "++(,)"
  currentpoint += p;
  return currentpoint;
}
point rlp(real px, real py) {
  return rlp((px, py));
}

//polars
point pol(real a, real r) { //as PGF "(:)"
  currentpoint = R.polar(r, radians(a));
  return currentpoint;
}
point p(real a, real r) { //as PGF "(:)"
  return pol(a, r);
}

point rp(real a, real r) { //as PGF "+(:)"
  return currentpoint + R.polar(r, radians(a));
}

point rpp(real a, real r) { //as PGF "++(:)"
  currentpoint += R.polar(r, radians(a));
  return currentpoint;
}

path circ(point c, real r) {
  return circle(c, r);
}

path circr(point c, real r) {
  currentpoint = c;
  return circ(c, r);
}

path rectangle(point a, point b) {
  return a -- (a.x, b.y) -- b -- (b.x, a.y) -- cycle;
}

path rect(point a, point b) {
  return rectangle(a, b);
}

path rectr(point a, point b) {
  currentpoint = ((b.x - a.x) / 2 + a.x, (b.y - a.y) / 2 + a.y);
  return rect(a, b);
}

struct ArcMode {
  static int Start = 0;
  static int Center = 1;
}

struct SizeMode {
  static int Side = 0;
  static int Med = 1;
}

path warc(point a, real s, real e, real r, int md=ArcMode.Start) {
  point c = (0, 0);
  if(md == ArcMode.Start) {
    c = (a.x - r * cos(radians(s)), a.y - r * sin(radians(s)));
  } else {
    c = a;
  }
  return arc(c, r, s, e);
}

path warcr(point a, real s, real e, real r) {
  currentpoint = a;
  return warc(a, s, e, r);
}

triangle etrian(real x, real a=0, point pos=(0,0), int md=ArcMode.Center, int sd=SizeMode.Med) { //equilateral, regular
  real M = 0;
  real xx = 0;
  if(sd == SizeMode.Side) {
    //len of median \frac{\sqrt{3}x}{2}
    M = sqrt(3) * x / 2;
    xx = x;
  } else {
    println("sss");
    M = x;
    xx = 2 * M / sqrt(3);
    print(xx);
  }
  //len two parts of median (1:2)
  real MCV = 2/3 * M;
  //Vertices
  point MCVA = pos + (MCV * cos(radians(a + 210)), MCV * sin(radians(a + 210))); //if pos is center!

  return triangleabc(xx, xx, xx, a, MCVA);
}

triangle etrianr(real A, real a=0, point pos=(0,0)) {
  currentpoint = pos;
  return etrian(A, a, pos);
}

struct NodedPicture {
       picture parent;
       pair[] nodes;
       void operator init() {

       }
       void addNode(pair node) {
       	    this.nodes.push(node);
       }
       void addNodes(pair[] node) {
            this.nodes.append(node);
       }
       void drawWithAddNode(path pth, int i, Label L="", align align=NoAlign, pen p=currentpen, arrowbar arrow=None, arrowbar bar=None, margin margin=NoMargin, Label legend="", marker marker=nomarker) {
       	    addNode(point(pth, i));
	    
	    draw(pic=parent, L=L, pth, align=align, p=p, arrow=arrow, bar=bar, margin=margin, legend=legend, marker=marker);
	    resetp();
       }
       void drawWithAddNodes(path pth, int[] ii, Label L="", align align=NoAlign, pen p=currentpen, arrowbar arrow=None, arrowbar bar=None, margin margin=NoMargin, Label legend="", marker marker=nomarker) {
            for(int i = 0; i < ii.length; ++i) {
	    	    addNode(point(pth, ii[i]));
            }
	    draw(pic=parent, L=L, pth, align=align, p=p, arrow=arrow, bar=bar, margin=margin, legend=legend, marker=marker);
	    resetp();
       }
       void drawWithAddNodes(path pth, Label L="", align align=NoAlign, pen p=currentpen, arrowbar arrow=None, arrowbar bar=None, margin margin=NoMargin, Label legend="", marker marker=nomarker) {
            for(int i = 0; i < size(pth); ++i) {
	    	    addNode(point(pth, i));
            }
	    draw(pic=parent, L=L, pth, align=align, p=p, arrow=arrow, bar=bar, margin=margin, legend=legend, marker=marker);
	    resetp();
       }
       void drawPic(NodedPicture pic, bool addNd=true) {
            add(parent, pic.parent);
            resetp();
       }
}

picture operator cast(NodedPicture npic) {
	return npic.parent;
}
