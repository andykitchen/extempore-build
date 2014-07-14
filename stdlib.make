XTM = bash -c './extempore --run=<(printf "(sys:precomp:compile-xtm-file \"%q\" \#t \#t)\n" "$$0")'

core: libs/xtmmath.dylib libs/xtminstruments.dylib libs/xtmaudio_dsp.dylib

libs/xtmmath.dylib: libs/core/math.xtm
	$(XTM) $<

libs/xtminstruments.dylib: libs/core/instruments.xtm
	$(XTM) $<

libs/xtmaudio_dsp.dylib: libs/core/audio_dsp.xtm
	$(XTM) $<
