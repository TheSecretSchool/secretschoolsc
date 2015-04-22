
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

//: