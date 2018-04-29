Server.local.boot;
s.boot;
s.reboot;
w.close;

//display all files in folder inside an array, in post.
"/Users/JamesR/Music/Logic/Sleepsang/eternal-memory/xOffcuts-1/*".pathMatch;

//load all sounds in folder into arrayofbuffers z.
z = SoundFile.collectIntoBuffers("/Users/JamesR/Music/Logic/Sleepsang/eternal-memory/xOffcuts-1/*");

z[6].numChannels;
z[6].numFrames;


(
SynthDef.new(\ofcts1,  {
	arg buf=0, t_trig=1, spos=0, loop=0, dA=2, rate=1, numchannels=2, amp=1;
	var sig, env;
	sig = PlayBuf.ar(2, buf, rate, t_trig, spos, loop, doneAction: dA); //
	env = EnvGen.kr(Env.circle([0,0.1,0],[0.01, 3, 5]));
	sig = sig * env;
	sig = sig * amp;
	Out.ar(0, sig!2);
}).add;
)

c = z[30.rand];
d = Synth.new(\ofcts1, [\buf, c, \amp, 0.324, \loop, 0, \spos, (c.numFrames).rand, \rate, [1,2,4].choose ]);

e = Synth.new(\ofcts1, [\buf, z[7], \amp, 0.039, \loop, 1, \spos, 1, \rate, 1.6 ]);
f = Synth.new(\ofcts1, [\buf, z[9], \amp, 0.05, \loop, 1, \spos, 1, \rate, 0.9 ]);
g = Synth.new(\ofcts1, [\buf, z[29], \amp, 0.2, \loop, 1, \spos, 940800.rand, \rate, 3.5 ]);

d.set(\rate, 0.5);
d.set(\amp, 0.1);
d.freeAll; // what should this be

e.set(\rate, 2);
e.set(\amp, 0.01);

f.set(\rate, 0.4);
f.set(\amp, 0.03);
f.clear;

g.set(\rate, 1.75);
g.set(\amp, 0.03);


