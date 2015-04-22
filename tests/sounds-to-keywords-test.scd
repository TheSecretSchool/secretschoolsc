Library.put

//:
Help.gui;
//:


~addaudio = { | string, audioname |
	var keys;
	keys = string[10].split collect: _.asSymbol;
	
	keys do: { | key |
		Library.put(\keys, key, \sounds,
			Library.at(\keys, key, \sounds) add: audioname
		)
	}
};

//:
