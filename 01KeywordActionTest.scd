
NetAddr("192.168.77,1", 5555).sendMsg("/test123", 1, 2.123, 3, pi);

NetAddr("192.168.77,1", 5555).sendMsg("/test123", 1, 2.123, 3, pi);

NetAddr("192.168.77,1", 5555).sendMsg("http://192.168.77.1/tw.html#Navigator:Navigator");

//:

OSCdef(\tiddler, { | msg |
	msg.postln;
	NetAddr("192.168.77,1", 5555).sendMsg('/url', msg[1], "blabla");
}, '/tiddler')
//:


OSCdef(\tiddlyKey, { | msg |
	msg.postln;
	NetAddr("192.168.77,1", 5555).sendMsg('/url', msg[1], msg [3]);
}, '/tiddlyKey')

//:


OSCdef(\tiddlyKey, { | msg |
	msg.postln;
	NetAddr("192.168.77,1", 5555).sendMsg('/url', msg[1], "http://secretschool/tw.html#Georgia 01:[[Georgia 01]]");
}, '/tiddlyKey')

//:


OSCdef(\tiddlyKey, { | msg |
	msg.postln;
	NetAddr("192.168.77,1", 5555).sendMsg('/url', msg[1],
		~keys[msg[2].asSymbol]
	);
}, '/tiddlyKey');


~keys = (
	years: "http://secretschool/tw.html#Georgia 02:[[Georgia 02]] Keywords",
	journey: "http://secretschool/tw.html#Georgia 01:[[Georgia 01]] Keywords"
);

//:


OSCdef(\tiddlyKey, { | msg |
	msg.postln;
	NetAddr("192.168.77,1", 5555).sendMsg('/url', msg[1],
		~keys[msg[2].asSymbol].choose
	);
}, '/tiddlyKey');


~keys = (
	years: [
		"http://secretschool/tw.html#Georgia 01:[[Georgia 01]] Keywords",
		"http://secretschool/tw.html#Georgia 02:[[Georgia 02]] Keywords"
	],
	journey: [
		"http://secretschool/tw.html#Georgia 03:[[Georgia 03]] Keywords",
		"http://secretschool/tw.html#Georgia 04:[[Georgia 04]] Keywords"
	]
);

