# Welcome to Sonic Pi v3.1

#use_bpm 105
use_bpm 120

r = 'C:\wavs\samples\A3143_synthwave\LTSW_120_Spectrum\LTSW_120_Spectrum_Drums_Ful.wav'

amp_drum = 2
live_loop :drums do
  sample r ,amp: amp_drum ,start: 0.5 ,finish: 1
  sleep 16
  
end

amp_drum_eb = 0
eb = 'C:\wavs\samples\KaeruCafe\EuroBeatConstructionAgain\01 Demo-1_124bpm.wav'
live_loop :drum_eb do
  sample eb ,amp: amp_drum_eb ,start: 0.274 ,finish: 0.463 ,rate: 0.956
  sleep 16
end

# other_noise voices
eriff = 'C:\wavs\samples\KaeruCafe\KaeruCafe_KACA0084_mad_green\07track.wav'
amp_eriff = 0
live_loop :eriff do
  sample eriff ,amp: amp_eriff , start: 0.1, finish:0.3
  sleep 8
end

# other_noise voices
flute = 'C:\wavs\samples\PS-25 WAV Pop & Funk Brass\WAV Solo Flute\25o16flt.wav'
amp_flute = 0
live_loop :flute do
  with_fx :reverb do
    sample flute ,amp: amp_flute
  end
  sleep 8
end

# other_noise voices
sax = 'C:\wavs\samples\PS-25 WAV Pop & Funk Brass\WAV Solo Sax\25q03sax.wav'
amp_sax = 0
live_loop :sax do
  #sample eriff ,amp: amp_other_noise_2
  sleep 2
  with_fx :reverb do
    sample sax ,amp: amp_sax
  end
  sleep 6
end

syn = 'C:\wavs\samples\KaeruCafe\EuroBeatConstructionAgain\77 Synth.wav'
amp_syn = 2
live_loop :syn ,sync: :drums do
  sample  syn,
    amp: amp_syn ,start: 0.5, finish: 0.16
  sleep 0.5
  sleep 3.5
end

# random increment
# other noise
v = 'C:\wavs\samples\voice\20191228134240.wav'
amp_other_noise = 0
live_loop :other_noise ,sync: :drums do
  sample v ,amp: amp_other_noise
  sleep 16
end



