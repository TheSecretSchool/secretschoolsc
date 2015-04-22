
~interviewPath = "~/Music/sounds/150400Performigrations/georgia-cut-wav/";

~paths = (~interviePath ++ "*.wav").pathMatch;

~testPath = ~paths [0];

Help.gui;

//:

SynthDef("help-Diskin", { arg bufnum = 0;
	Out.ar(0, DiskIn.ar(1, bufnum));
}).send(s)

//:

~buffer = Buffer.read (Server.default, ~testPath);
//:

~buffer.bufnum;

//:
Synth ("help-Diskin", ~buffer.bufnum);

//:
b = Buffer.cueSoundFile(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff", 0, 1);

x = { DiskIn.ar(1, b.bufnum) }.play;

b.close;
//:

~simplePlayFile = { | path |
	var b, x;
b = Buffer.cueSoundFile(Server.default, path, 0, 2);

x = { DiskIn.ar(2, b.bufnum) }.play;

b.close;	
	
};
//:
~simplePlayFile.(~testPath);
//:

OSCDef (\playSoundFile, { | msg |
	
})

//: