import geometry;
import asynoded;

path lowerpart = (0, 14)--(0, 0)--(15, 0)--(30, 0)--t(30, 14);
NodedPicture Tank;
//Tank.drawWithAddNodes((-1,-0.915) to [out=270, in=270] (1,-0.915)-- to((1,0.915) to out=90, in=90) (-1,0.915)--cycle)
//Tank.drawNodes();

NodedPicture ConeRoofTank; //checked?
ConeRoofTank.drawWithAddNodes((0, 25)--lowerpart--rlp(0, +11)--rlp(-15, +4)--cycle);
//ConeRoofTank.drawNodes();

NodedPicture DomeRoofTank; //checked
DomeRoofTank.drawWithAddNodes((-1.5,-1.5) -- (1.5,-1.5) --
                              (1.5,0.7) .. controls (1.5, 1.3) and (0.6, 1.5) .. //to((1.5,0.7), out=90, in=0)
                              (0, 1.5) .. controls (-0.6, 1.5) and (-1.5, 1.3) .. //to((0,1.5), out=180, in=90)
                              (-1.5,0.7) -- cycle);
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

NodedPicture Drum;
/*Drum.drawWithAddNodes((0.324,-0.3) to [out=0, in=0]
		(0.324,0.3) --
		to((-0.324,0.3), out=180, in=180)
		(-0.324,-0.3) -- cycle
);*/
//Drum.drawNodes();

NodedPicture CentrifugalPump;

CentrifugalPump.drawWithAddNodes(circ((0,0), 0.4));
CentrifugalPump.drawWithAddNodes(circ((0,0), 0.05));
  //(0,0) circle (0.4) circle (0.05);
CentrifugalPump.drawWithAddNodes(
		rpp(230.19, 0.4) --
		rpp(230.19, 0.377) --
		rlp(1,0) //-- rpp(129.81, 0.377)
);
CentrifugalPump.drawWithAddNodes(circle((0,0), 0.377));

//CentrifugalPump.drawNodes();

NodedPicture HeatExchanger;
HeatExchanger.drawWithAddNodes(circ((0,0), 0.5));
HeatExchanger.drawWithAddNodes((-0.5,0) --
		(-0.25,0) --
		(-0.25,0.3) --
		(0.25,-0.3) --
		(0.25,0) -- (0.5,0)
);
//HeatExchanger.drawNodes();

NodedPicture BiPhaseHeatExchanger;
BiPhaseHeatExchanger.drawWithAddNodes(circ((0,0), 0.5));
BiPhaseHeatExchanger.drawWithAddNodes(pol(30, 0.5) --
		rlp(-0.6,0) --
		rlp(0.3,-0.25) --
		rlp(-0.3,-0.25) -- rlp(0.6,0)
);
//BiPhaseHeatExchanger.drawNodes();

NodedPicture TubeShellHeatExchanger;
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

NodedPicture Packing;
Packing.drawWithAddNodes(
		(-0.8,-0.7) --
		(0.8,0.7) --
		(-0.8,0.7) --
		(0.8,-0.7) -- cycle
);
//Packing.drawNodes();

NodedPicture Bubbler;
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

NodedPicture Sprayer;
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
