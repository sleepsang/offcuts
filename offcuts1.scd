Server.local.boot;
s.boot;
s.reboot;
w.minimize;
w.unminimize;

//display all files in folder inside an array, in post.
"/Users/JamesR/Music/Logic/Sleepsang/eternal-memory/xOffcuts-1/*".pathMatch;

//load all sounds in folder into arrayofbuffers z.
z = SoundFile.collectIntoBuffers("/Users/JamesR/Music/Logic/Sleepsang/eternal-memory/xOffcuts-1/*");

z[6].numChannels;
z[6].numFrames;

//ofcts1 sample play synth. add pitch instead of rate, more

(
SynthDef.new(\ofcts1,  {
	arg buf=0, t_trig=1, spos=0, loop=0, dA=2, freq=1, pos=0, numchannels=2, amp=1, out=0;
	var sig, env;
	sig = PlayBuf.ar(2, buf, BufRateScale.ir(buf)*freq, t_trig, spos, loop, doneAction: dA); //
	env = EnvGen.kr(Env.circle([0,0.1,0],[0.01, 1.7, 0.2],1));
	sig = sig * env;
	sig = Pan2.ar(sig,pos,amp);
	Out.ar(out, sig);
}).add;
)

c = z[30.rand];
c.numChannels;
c.numFrames;
c.plot;
d = Synth.new(\ofcts1, [\buf, c, \amp, 0.624, \loop, 1, \spos, (c.numFrames).rand, \freq, -1, \pos, 1, \out, 0]);


e = Synth.new(\ofcts1, [\buf, z[7], \amp, 0.039, \loop, 1, \spos, 1, \freq, 440 ]);
f = Synth.new(\ofcts1, [\buf, z[9], \amp, 0.05, \loop, 1, \spos, 1, \rate, 0.9 ]);
g = Synth.new(\ofcts1, [\buf, z[29], \amp, 0.2, \loop, 1, \spos, 940800.rand, \rate, 3.5 ]);

d.set(\rate, 0.2);
d.set(\amp, 0.1);
d.freeAll; // what should this be

e.set(\rate, 2);
e.set(\amp, 0.01);

f.set(\rate, 0.4);
f.set(\amp, 0.03);
f.clear;

g.set(\rate, 1.75);
g.set(\amp, 0.03);


