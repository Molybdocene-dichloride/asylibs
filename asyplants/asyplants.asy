import geometry;
import asynoded;

//Parts
path lowerpart = (-1.5, 0.62)--(-1.5, -1.5)--(0, -1.5)--(1.5, -1.5)--t(1.5, 0.62);

NodedPicture Packing; //checked
Packing.drawWithAddNodes(
		(-0.8,-0.7) --
		(0.8,0.7) --
		(-0.8,0.7) --
		(0.8,-0.7) -- cycle
);
//Packing.drawNodes();

NodedPicture Bubbler; //checked
Bubbler.drawWithAddNodes((0,0) --
			 t(1.4,0) -- rlp(0.1,0.1));
Bubbler.drawWithAddNodes(t(0.2,0) -- rlp(-0.1,0.1));
Bubbler.drawWithAddNodes(t(0.2,0) -- rlp(0.1,0.1));
Bubbler.drawWithAddNodes(t(0.6,0) -- rlp(-0.1,0.1));
Bubbler.drawWithAddNodes(t(0.6,0) -- rlp(0.1,0.1));
Bubbler.drawWithAddNodes(t(1.0,0) -- rlp(-0.1,0.1));
Bubbler.drawWithAddNodes(t(1.0,0) -- rlp(0.1,0.1));
Bubbler.drawWithAddNodes(t(1.4,0) -- rlp(-0.1,0.1));
//Bubbler.drawNodes();

NodedPicture Sprayer; //checked
Sprayer.drawWithAddNodes((0,0) --
			 t(1.4,0) -- rlp(0.1,-0.1));
Sprayer.drawWithAddNodes(t(0.2,0) -- rlp(-0.1,-0.1));
Sprayer.drawWithAddNodes(t(0.2,0) -- rlp(0.1,-0.1));
Sprayer.drawWithAddNodes(t(0.6,0) -- rlp(-0.1,-0.1));
Sprayer.drawWithAddNodes(t(0.6,0) -- rlp(0.1,-0.1));
Sprayer.drawWithAddNodes(t(1.0,0) -- rlp(-0.1,-0.1));
Sprayer.drawWithAddNodes(t(1.0,0) -- rlp(0.1,-0.1));
Sprayer.drawWithAddNodes(t(1.4,0) -- rlp(-0.1,-0.1));
//Sprayer.drawNodes();

//Utility
triangle valvetriangle = etrian(0.2, 270);
NodedPicture Valve; //checked
Valve.drawWithAddNodes(valvetriangle);
Valve.drawWithAddNodes(shift((valvetriangle.C.x + 0.2 * 2/3, 0))*rotate(180)*valvetriangle);

NodedPicture ThreeWayValve; //checked
ThreeWayValve.drawPic(Valve);
ThreeWayValve.drawWithAddNodes(shift((valvetriangle.C.x, 0.2 * 2/3))*rotate(270)*valvetriangle);

NodedPicture FourWayValve; //checked
FourWayValve.drawPic(Valve);
FourWayValve.drawWithAddNodes(shift((valvetriangle.C.x, 0.2 * 2/3))*rotate(270)*valvetriangle);
FourWayValve.drawWithAddNodes(shift((valvetriangle.C.x, -0.2 * 2/3))*rotate(90)*valvetriangle);

//RotaryFeeder
NodedPicture RotaryFeeder; //checked?
RotaryFeeder.drawWithAddNodes(circ((0, 0), 0.1));
RotaryFeeder.drawWithAddNodes(
		p(270 - 39.81, 0.1) --
		rlp(0, -0.05) --
		rlp(0.128, 0) -- p(270 + 39.81, 0.1)
);
RotaryFeeder.drawWithAddNodes(
		p(90 + 39.81, 0.1) --
		rlp(0, 0.05) --
		rlp(0.128, 0) -- p(90 - 39.81, 0.1)
);

//HighPressureRotaryFeeder
NodedPicture HighPressureRotaryFeeder; //checked?
HighPressureRotaryFeeder.drawWithAddNodes(circ((0, 0), 0.1));
HighPressureRotaryFeeder.drawWithAddNodes(
		p(270 - 39.81, 0.1) --
		rlp(0.025, -0.08) --
		rlp(0.128-0.05, 0) -- p(270 + 39.81, 0.1)
);
HighPressureRotaryFeeder.drawWithAddNodes(
		p(90 + 39.81, 0.1) --
		rlp(0.025, 0.08) --
		rlp(0.128-0.05, 0) -- p(90 - 39.81, 0.1)
);
HighPressureRotaryFeeder.drawWithAddNodes(
		p(180 - 39.81, 0.1) --
		rlp(-0.08, -0.025) --
		rlp(0, -0.128+0.05) -- p(180 + 39.81, 0.1)
);
HighPressureRotaryFeeder.drawWithAddNodes(
		p(0 - 39.81, 0.1) --
		rlp(0.08, 0.025) --
		rlp(0, 0.128-0.05) -- p(0 + 39.81, 0.1)
);

//HighPressureRotaryFeeder
NodedPicture HighPressureRotaryFeederA; //checked?
HighPressureRotaryFeederA.drawWithAddNodes(circ((0, 0), 0.1));
HighPressureRotaryFeederA.drawWithAddNodes(rect(/*(0, 0),*/ (-0.14, -0.1), (0.14, 0.1)));
HighPressureRotaryFeederA.drawWithAddNodes(
                pl((0, -0.024), 270 - 39.81, 0.1) --
		rlp(0.025, -0.08) --
		rlp(0.128-0.05, 0) -- pl((0, -0.024), 270 + 39.81, 0.1)
);
HighPressureRotaryFeederA.drawWithAddNodes(
		pl((0, 0.024), 90 + 39.81, 0.1) --
		rlp(0.025, 0.08) --
		rlp(0.128-0.05, 0) -- pl((0, 0.024), 90 - 39.81, 0.1)
);
HighPressureRotaryFeederA.drawWithAddNodes(
                pl((-0.064, 0), 180 - 39.81, 0.1) --
		rlp(-0.08, -0.025) --
		rlp(0, -0.128+0.05) -- pl((-0.064, 0), 180 + 39.81, 0.1)
);
HighPressureRotaryFeederA.drawWithAddNodes(
                pl((0.064, 0), 0 - 39.81, 0.1) --
		rlp(0.08, 0.025) --
		rlp(0, 0.128-0.05) -- pl((0.064, 0), 0 + 39.81, 0.1)
);

//Tanks
NodedPicture Tank; //checked
Tank.drawWithAddNodes((-1, -0.915) .. controls (-1, -1.215) and (-0.30, -1.325) .. // to [out=270, in=270]
  (0, -1.325) .. controls (0.30, -1.325) and (1, -1.215) .. 
  (1, -0.915) -- (1, 0.915) .. controls (1, 1.215) and (0.30, 1.325) .. //to((1, 0.915), out=90, in=90)
  (0, 1.325) .. controls (-0.30, 1.325) and (-1, 1.215) .. (-1, 0.915) -- cycle
);
//Tank.drawNodes();

NodedPicture BlowTank; //checked
BlowTank.drawWithAddNodes(rect((-0.378, -1.4), (0.378, -1.3)));
BlowTank.drawWithAddNodes(rect((-0.378, 1.25), (0.378, 1.15)));

BlowTank.drawWithAddNodes(rect((-0.567, -1), (0.567, 1)));

BlowTank.drawWithAddNodes((-0.567, 1) -- (-0.378, 1.15) -- (0.378, 1.15) -- (0.567, 1));
BlowTank.drawWithAddNodes((-0.567, -1) -- (-0.378, -1.3) -- (0.378, -1.3) -- (0.567, -1));
//BlowTank.drawNodes();

NodedPicture DPTank; //checked?
DPTank.drawWithAddNodes(rect((-0.4, -1.1), (0.4, 1.1)));
DPTank.drawWithAddNodes(rect((-0.45, -1.3), (0.45, -1.2)));
DPTank.drawWithAddNodes((-0.45, -1.2)--(-0.4, -1.1));
DPTank.drawWithAddNodes((0.45, -1.2)--(0.4, -1.1));
//DPTank.drawNodes();

NodedPicture ConeRoofTank; //checked
ConeRoofTank.drawWithAddNodes((-1.5, 1.1)--lowerpart--(1.5, 1.1)--(0, 1.5)--cycle);
//ConeRoofTank.drawNodes();

NodedPicture DomeRoofTank; //checked
DomeRoofTank.drawWithAddNodes((-1.5, -1.5) -- (1.5, -1.5) --
                              (1.5, 0.7) .. controls (1.5, 1.3) and (0.6, 1.5) .. //to((1.5,0.7), out=90, in=0)
                              (0, 1.5) .. controls (-0.6, 1.5) and (-1.5, 1.3) .. //to((0,1.5), out=180, in=90)
                              (-1.5, 0.7) -- cycle);
//DomeRoofTank.drawNodes();

NodedPicture FloatingRoofTank; //checked
FloatingRoofTank.drawWithAddNodes((-1.5,1.5) --
		(-1.5,-1.5) --
		(1.5,-1.5) --
		(1.5,1.5)
);
FloatingRoofTank.drawWithAddNodes(circ((-1.45,1.4), (0.05)));
FloatingRoofTank.drawWithAddNodes(circ((1.45,1.4), (0.05)));
FloatingRoofTank.drawWithAddNodes(rect((-1.4,1.3), (1.4,1.5)));
//FloatingRoofTank.drawNodes();

NodedPicture Silos; //checked
Silos.drawWithAddNodes((-0.7,-0.8) --
		(0,-1.8) --
		(0.7,-0.8) --
		(0.7,1.590) .. controls (0.7, 1.89) and (0.30, 2.0) .. //to((0.7,1.590), out=90, in=90)
		(0, 2.0) .. controls (-0.30, 2.0) and (-0.7, 1.89) ..
                (-0.7,1.590) -- cycle
);
Silos.drawWithAddNodes((-0.7,-0.8) -- (-0.7,-2));
Silos.drawWithAddNodes((-0.8,-2) -- (-0.6,-2));
Silos.drawWithAddNodes((0.7,-0.8) -- (0.7,-2));
Silos.drawWithAddNodes((0.6,-2) -- (0.8,-2));
//Silos.drawNodes();

NodedPicture Drum; //checked
Drum.drawWithAddNodes((0.324,-0.3) .. controls (0.384, -0.3) and (0.484, -0.15) .. 
		(0.484, 0) .. controls (0.484, 0.15) and (0.384, 0.3) .. //(0.324,-0.3) to [out=0, in=0]
		(0.324,0.3) -- (-0.324,0.3) .. controls (-0.384, 0.3) and (-0.484, 0.15) .. 
		(-0.484, 0) .. controls (-0.484, -0.15) and (-0.384, -0.3) .. //to((-0.324,0.3), out=180, in=180)
                (-0.324,-0.3) -- cycle
);
//Drum.drawNodes();

//Pumps
NodedPicture CentrifugalPump; //checked
CentrifugalPump.drawWithAddNodes(circ((0,0), 0.4));
CentrifugalPump.drawWithAddNodes(circ((0,0), 0.05));
  //(0,0) circle (0.4) circle (0.05);
CentrifugalPump.drawWithAddNodes(rpp(230.19, 0.4) --
		rpp(230.19, 0.377) --
		rlp(1,0) -- rpp(129.81, 0.377)
);
//CentrifugalPump.drawNodes();

NodedPicture Compressor;
Compressor.drawWithAddNodes((-0.4,-0.5) --
		(0.4,-0.2) --
		(0.4,0.2) --
                (-0.4,0.5) -- cycle
);
//Compressor.drawNodes();

NodedPicture CentrifugalCompressor;
CentrifugalCompressor.drawWithAddNodes((-0.9,-0.4) --
		(0.9,-0.2) --
		(0.9,0.2) --
                                       (-0.9,0.4) -- cycle);
CentrifugalCompressor.drawWithAddNodes((-0.8,-0.39) -- (-0.8,-0.6));
CentrifugalCompressor.drawWithAddNodes((0.8,-0.21) -- (0.8,-0.6));
CentrifugalCompressor.drawWithAddNodes((-1.0,-0.6) -- (1.0,-0.6));
//CentrifugalCompressor.drawNodes();

NodedPicture MultiStageCompressor;
MultiStageCompressor.drawWithAddNodes(circ((0,0), 0.4));
MultiStageCompressor.drawWithAddNodes((0.2,-0.346) --
		(0.7,-0.346) --
                                      (0.7,0.346) -- (0.2,0.346));
MultiStageCompressor.drawWithAddNodes((0.7,-0.231) --
		(1.1,-0.231) --
                                      (1.1,0.231) -- (0.7,0.231));
MultiStageCompressor.drawWithAddNodes((1.1,-0.116) --
		(1.4,-0.116) --
                                      (1.4,0.116) -- (1.1,0.116));
MultiStageCompressor.drawWithAddNodes((0.2,-0.346) -- (0.2,-0.6));
MultiStageCompressor.drawWithAddNodes((-0.2,-0.346) -- (-0.2,-0.6));
MultiStageCompressor.drawWithAddNodes((1.3,-0.116) -- (1.3,-0.6));
MultiStageCompressor.drawWithAddNodes((-0.5,-0.6) -- (1.5,-0.6));
//MultiStageCompressor.drawNodes();

NodedPicture HeatExchanger; //checked
HeatExchanger.drawWithAddNodes(circ((0,0), 0.5));
HeatExchanger.drawWithAddNodes((-0.5,0) --
		(-0.25,0) --
		(-0.25,0.3) --
		(0.25,-0.3) --
		(0.25,0) -- (0.5,0)
);
//HeatExchanger.drawNodes();

NodedPicture BiPhaseHeatExchanger; //checked
BiPhaseHeatExchanger.drawWithAddNodes(circ((0,0), 0.5));
BiPhaseHeatExchanger.drawWithAddNodes(pol(30, 0.5) --
		rlp(-0.6,0) --
		rlp(0.3,-0.25) --
		rlp(-0.3,-0.25) -- rlp(0.6,0)
);
//BiPhaseHeatExchanger.drawNodes();

//Evaporators
NodedPicture TubeBundleEvaporator; //checked
TubeBundleEvaporator.drawWithAddNodes((-0.8,-1.032) .. controls (-0.8, -1.032-0.30) and (-0.30, -1.032-0.44) .. 
		(0,-1.032-0.44) .. controls (0.30, -1.032-0.44) and (0.8, -1.032-0.30) .. 
                //(-0.8,-1.032-0.13) to [out=270, in=270]
                (0.8,-1.032) -- (0.8,1.032) .. 
                controls (0.8, 1.032+0.30) and (0.30, 1.032+0.44) .. 
		(0,1.032+0.44) .. controls (-0.30, 1.032+0.44) and (-0.8, 1.032+0.30) .. 
                 //to [out=90, in=90]
                (-0.8,1.032) -- cycle);
for(int i : numbs(10)) {
  TubeBundleEvaporator.drawWithAddNodes(t(-0.85,-0.9 + 0.08*i) -- rlp(1.7,0));
}
TubeBundleEvaporator.drawWithAddNodes((-0.85,-0.95) -- (-0.85,-0.05));
TubeBundleEvaporator.drawWithAddNodes((0.85,-0.95) -- (0.85,-0.05));
TubeBundleEvaporator.drawWithAddNodes((-0.755,1.2) -- (0.755,1.2), denselydotted);
//TubeBundleEvaporator.drawNodes();

NodedPicture TubeBundleEvaporatorA; //checked
TubeBundleEvaporatorA.drawWithAddNodes((-0.8,-1.032-0.44) -- (0.8,-1.032-0.44) -- (0.8,1.032+0.44) -- (-0.8,1.032+0.44) -- cycle);
for(int i : numbs(10)) {
  TubeBundleEvaporatorA.drawWithAddNodes(t(-0.85,-0.9 + 0.08*i) -- rlp(1.7,0));
}
TubeBundleEvaporatorA.drawWithAddNodes((-0.85,-0.95) -- (-0.85,-0.05));
TubeBundleEvaporatorA.drawWithAddNodes((0.85,-0.95) -- (0.85,-0.05));
TubeBundleEvaporatorA.drawWithAddNodes((-0.755,1.2) -- (0.755,1.2), denselydotted);
//TubeBundleEvaporatorA.drawNodes();

NodedPicture BasketEvaporator; //checked
BasketEvaporator.drawWithAddNodes((-0.8,-1.032) .. controls (-0.8, -1.032-0.30) and (-0.30, -1.032-0.44) .. 
		(0,-1.032-0.44) .. controls (0.30, -1.032-0.44) and (0.8, -1.032-0.30) .. 
                //(-0.8,-1.032-0.13) to [out=270, in=270]
                (0.8,-1.032) -- (0.8,1.032) .. 
                controls (0.8, 1.032+0.30) and (0.30, 1.032+0.44) .. 
		(0,1.032+0.44) .. controls (-0.30, 1.032+0.44) and (-0.8, 1.032+0.30) .. 
                 //to [out=90, in=90]
                (-0.8,1.032) -- cycle);
for(int i : numbs(19, 1)) {
  BasketEvaporator.drawWithAddNodes(t(-0.8 + 0.08*i,-0.9) -- rlp(0,0.8));
}
BasketEvaporator.drawWithAddNodes((-0.85,-0.9) -- (0.85,-0.9));
BasketEvaporator.drawWithAddNodes((-0.85,-0.1) -- (0.85,-0.1));
BasketEvaporator.drawWithAddNodes((-0.755,1.2) -- (0.755,1.2), denselydotted);
//BasketEvaporator.drawNodes();

NodedPicture BasketEvaporatorA; //checked
BasketEvaporatorA.drawWithAddNodes((-0.8,-1.032-0.44) -- (0.8,-1.032-0.44) -- (0.8,1.032+0.44) -- (-0.8,1.032+0.44) -- cycle);
for(int i : numbs(19, 1)) {
  BasketEvaporatorA.drawWithAddNodes(t(-0.8 + 0.08*i,-0.9) -- rlp(0,0.8));
}
BasketEvaporatorA.drawWithAddNodes((-0.85,-0.9) -- (0.85,-0.9));
BasketEvaporatorA.drawWithAddNodes((-0.85,-0.1) -- (0.85,-0.1));
BasketEvaporatorA.drawWithAddNodes((-0.755,1.2) -- (0.755,1.2), denselydotted);
//BasketEvaporatorA.drawNodes();

NodedPicture TubeShellHeatExchanger; //checked
TubeShellHeatExchanger.drawWithAddNodes((-1.0,-0.3) --
		warc((0.7,-0.3), 270, 450, 0.3) --
		(-1.0,0.3) -- cycle
);
for(int i = 1; i < 10;++i) {
  TubeShellHeatExchanger.drawWithAddNodes(t(-0.6,-0.3 + 0.06*i) -- rlp(1.2,0));
}
TubeShellHeatExchanger.drawWithAddNodes((-1.0,-0.35) -- (-1.0,-0.3));
TubeShellHeatExchanger.drawWithAddNodes((-1.0,0.35) -- (-1.0,0.3));
TubeShellHeatExchanger.drawWithAddNodes((-0.6,-0.35) -- (-0.6,0.35));
TubeShellHeatExchanger.drawWithAddNodes((0.6,-0.35) -- (0.6,0.35));
//TubeShellHeatExchanger.drawNodes();

//Sort
NodedPicture PressureSort; //checked
PressureSort.drawWithAddNodes(warc((0, 0.6 - 0.4 / cos(radians(30)) * sin(radians(30))), 30, 150, 0.4 / cos(radians(30)), ArcMode.Center));
PressureSort.drawWithAddNodes(rect((-0.4, -0.6), (0.4, 0.6)));
PressureSort.drawWithAddNodes(rect((-0.3, -0.7), (0.3, -0.6)));
PressureSort.drawWithAddNodes(rect((-0.4, -0.8), (0.4, -0.7)));
PressureSort.drawWithAddNodes(rect((-0.5, -0.9), (0.5, -0.8)), isfill=1);
//PressureSort.drawNodes();

//Filter
NodedPicture RotaryFilter; //checked
RotaryFilter.drawWithAddNodes(circ((0,0), (0.5)));
RotaryFilter.drawWithAddNodes(circ((0,0), (0.05)));
RotaryFilter.drawWithAddNodes((-0.7,0) --
                             warc((-0.6,0), 180, 360, 0.6) -- (0.5,0));
//RotaryFilter.drawNodes();

NodedPicture PressFilter; //checked
PressFilter.drawWithAddNodes(rect((-0.9,-0.4), (0.9,0.4)));
for(int i = 1; i <= 17;++i) {
  PressFilter.drawWithAddNodes(t(-0.9 + 0.1*i,-0.4) -- rlp(0,0.8));
}
PressFilter.drawWithAddNodes((-1,-0.4) --
		(-1,-0.5) --
		(1,-0.5) --
                             (1,-0.4));
//PressFilter.drawNodes();

NodedPicture DrumFilter; //checked
DrumFilter.drawWithAddNodes(rect((-0.9, -0.45), (0.9, 0.45)));
DrumFilter.drawWithAddNodes(warc((0, 0.45 - 0.65 * sin(radians(30))), 30, 150, 0.65, ArcMode.Center));
//DrumFilter.drawNodes();

//Deck
NodedPicture DeckScreen; //checked?
DeckScreen.drawWithAddNodes((-1,0) --
		(0,-1) --
		(1,0) --
		(1,0.5) --
                (-1,0.5) -- cycle);
DeckScreen.drawWithAddNodes((-1,0) -- (1,0));
DeckScreen.drawWithAddNodes((-1,0.5) -- (1,0), denselydotted);
//DeckScreen.drawNodes();

//Diffuser

//DD

//Cyclone
NodedPicture Cyclone;
Cyclone.drawWithAddNodes(rect((-0.3,0.25), (0.3,0)));
Cyclone.drawWithAddNodes((0.3,0) -- (0,-1.0) -- (-0.3,0));
//Cyclone.drawNodes();

//Table

//Digester
NodedPicture Washer; //checked?
Washer.drawWithAddNodes((0.4, 1.5) -- (0.4, -1.5) -- (0.45, -1.6) -- (0.45, -1.8) .. controls (0.45, -1.8-0.30) and (0.40, -1.8-0.44) .. 
		(0,-1.8-0.44) .. controls (-0.40, -1.8-0.44) and (-0.45, -1.8-0.30) .. (-0.45, -1.8) -- (-0.45, -1.6) -- (-0.4, -1.5) -- (-0.4, 1.5) -- cycle);
Washer.drawWithAddNodes((-0.4, 1.35) -- (0.4, 1.35));
Washer.drawWithAddNodes((-0.45, -1.6) -- (0.45, -1.6));
Washer.drawWithAddNodes((-0.4, -1.5) -- (0.4, -1.5));
Washer.drawWithAddNodes((-0.45, -1.7) -- (0.45, -1.7));
Washer.drawWithAddNodes((-0.15, -2.238) -- (-0.15, -2.52) -- (0.15, -2.52) -- (0.15, -2.238));
Washer.drawWithAddNodes(rect((-0.16, -2.3), (0.16, -2.34)), isfill=1);
//Washer.drawNodes();


//Heater

//Bleached
