/* Wed, Apr 22 2015, 02:06 EDT

When a user clicks on a keyword link in TW, do the following: 

1. Navigate in the user's browser to a tiddler related to that keyword.
2. Post the keyword to chat.
3. Play a sound.

And: 

- Each keyword can lead to more than one tiddlers or sounds. 
- The tiddler and sound for a keyword is chosen each time
  at random from the collection of tiddlers and sounds
  corresponding to that keyword. 

*/


//:

~interview_folder = "~/Documents/Dev/Projects/Performigrations/Interview-material/";
~interview_paths = (~interview_folder ++ "*.wav").pathMatch;
~interview_dict = ();
~interview_paths do: { | p |
	~interview_dict[(PathName(p).fileNameWithoutExtension[10..]).asSymbol] = p;
};
//:
/*
Help.gui;
~interview_dict.keys;
~interview_dict[\agonas];
OSCFunc.trace(false);
*/

//:

~simplePlayFile = { | path |
	var b, x;
b = Buffer.cueSoundFile(Server.default, path, 0, 2);

x = { DiskIn.ar(2, b.bufnum) }.play;

b.close;	
	
};

//:

OSCdef(\tiddlyKey, { | msg |
	var content;
	msg.postln;
	content = ~keys[msg[2].asSymbol];
	
	NetAddr("192.168.77.1", 5555).sendMsg('/url', msg[1],
		"http://secretschool/tw.html#" ++ content[\tiddlers].choose
	);
	~simplePlayFile.(~interview_dict[content[\sounds].choose].postln)
	
}, '/tiddlyKey');
//:
~keys = (
	years: (
		tiddlers: [
			"Georgia 03:[[Georgia 03]] Keywords",
			"Georgia 04:[[Georgia 04]] Keywords",
			"Georgia 06:[[Georgia 06]] Keywords"
		],
		sounds: [
			'ti-na-kaneis',
			'archisa-na-klaio',
			'oloi-efygan'
		]
	),
	journey: (
		tiddlers: [
			"Georgia 01:[[Georgia 01]] Keywords",
			"Georgia 03:[[Georgia 03]] Keywords",
			"Georgia 05:[[Georgia 05]] Keywords"
		],
		sounds: [
			'agonas',
			'archisa-na-klaio',
			'oloi-efygan'
		]
	),
	migration: (
		tiddlers: [
			"Georgia 01:[[Georgia 01]] Keywords",
			"Georgia 02:[[Georgia 02]] Keywords",
			"Georgia 05:[[Georgia 05]] Keywords"
		],
		sounds: [
			'trelokomeio',
			'provlimata',
			'agonas',
			'archisa-na-klaio',
			'oloi-efygan'
		]
	)
	
);

//: Older version


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

