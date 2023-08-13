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

point t(point p) {
  currentpoint = p;
  return p;
}
point t(real px, real py) {
  return t((px, py));
}

point pol(real a, real r) {
  currentpoint = R.polar(r, a);
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
  currentpoint += R.polar(r, a);
  return currentpoint;
}

path circ(point c, real r) {
  currentpoint = c;
  return circle(c, r);
}

path warc(point c, real s, real e, real r) {
  currentpoint = c;
  return arc(c, r, s, e);
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
       }
       void drawWithAddNodes(path pth, int[] ii, Label L="", align align=NoAlign, pen p=currentpen, arrowbar arrow=None, arrowbar bar=None, margin margin=NoMargin, Label legend="", marker marker=nomarker) {
            for(int i = 0; i < ii.length; ++i) {
	    	    addNode(point(pth, ii[i]));
            }
	    draw(pic=parent, L=L, pth, align=align, p=p, arrow=arrow, bar=bar, margin=margin, legend=legend, marker=marker);
       }
       void drawWithAddNodes(path pth, Label L="", align align=NoAlign, pen p=currentpen, arrowbar arrow=None, arrowbar bar=None, margin margin=NoMargin, Label legend="", marker marker=nomarker) {
            for(int i = 0; i < size(pth); ++i) {
	    	    addNode(point(pth, i));
            }
	    draw(pic=parent, L=L, pth, align=align, p=p, arrow=arrow, bar=bar, margin=margin, legend=legend, marker=marker);
       }       
}

picture operator cast(NodedPicture npic) {
	return npic.parent;
}
