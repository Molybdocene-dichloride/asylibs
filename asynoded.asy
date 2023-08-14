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

string string(point p) {
  return "(" + string(p.x) + "," + string(p.y) + ")";
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

point pol(real a, real r) {
  currentpoint = R.polar(r, radians(a));
  return currentpoint;
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
}

picture operator cast(NodedPicture npic) {
	return npic.parent;
}
