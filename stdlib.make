XTM = bash -c './extempore --run=<(printf "(sys:precomp:compile-xtm-file \"%q\" \#t \#t)\n" "$$0")'

.PHONY: core external

core: libs/xtmmath.dylib libs/xtminstruments.dylib libs/xtmaudio_dsp.dylib

libs/xtmmath.dylib: libs/core/math.xtm
	$(XTM) $<

libs/xtminstruments.dylib: libs/core/instruments.xtm
	$(XTM) $<

libs/xtmaudio_dsp.dylib: libs/core/audio_dsp.xtm
	$(XTM) $<

external: libs/xtmfft.dylib libs/xtmsndfile.dylib libs/xtmaudio_dsp_ext.dylib libs/xtminstruments_ext.dylib

libs/xtmfft.dylib: libs/external/fft.xtm
	$(XTM) $<

libs/xtmaudio_dsp_ext.dylib: libs/external/audio_dsp_ext.xtm
	$(XTM) $<

libs/xtminstruments_ext.dylib: libs/external/instruments_ext.xtm
	$(XTM) $<
