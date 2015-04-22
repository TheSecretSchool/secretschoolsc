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

~simplePlayFile = { | path |
	var b, x;
	b = Buffer.cueSoundFile(Server.default, path, 0, 2);
	x = { DiskIn.ar(2, b.bufnum) }.play;
	b.close;
};

//:

OSCdef(\tiddlyKey, { | msg |
	var content, tiddlers, sounds;
	msg.postln;
	content = Library.at(\keys, [msg[2].asSymbol]);
	content !? {
		tiddlers = content[\tiddlers];
		sounds = content[\sounds];
	};

	tiddlers !? {
		NetAddr("192.168.77.1", 5555).sendMsg('/url', msg[1],
			"http://secretschool/tw.html#" ++ content[\tiddlers].choose
		);
	};
	sounds !? {
		~simplePlayFile.(~interview_dict[content[\sounds].choose].postln)
	};
	
}, '/tiddlyKey');
//:
