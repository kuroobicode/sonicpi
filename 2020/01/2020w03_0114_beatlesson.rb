# Welcome to Sonic Pi v3.1

use_bpm 105
live_loop :drums do
  sample  'C:\wavs\samples\A1871_hiphop\DWB_WAV_LOOPS\DWB_DRUMS\DWB_90_Drums_Indus.wav', amp:3 ,rate: 1.15, start:0, finish:0.125
  #sample :bass_trance_c, amp: 8 ,finish: 0.68
  sleep 4
end

amp_hh = 10
live_loop :drums_hh do
  hh = 'C:\wavs\samples\A1871_hiphop\DWB_WAV_LOOPS\DWB_DRUMS\DWB_90_Drums_Indus.wav'
  use_sample_defaults amp:amp_hh ,rate: 1.15, start:0.32, finish:0.322
  sample hh
  sleep 0.5
  sample hh
  sleep 0.5
  sample hh
  sleep 0.375
  sample hh
  sleep 0.125
  sample hh
  sleep 0.375
  sample hh
  sleep 0.125
  sample hh
  sleep 0.5
  sample hh
  sleep 0.5
  sample hh
  sleep 1
end

amp_str = 2
live_loop :string ,sync: :drums do
  #with_fx :slicer ,phase:0.25 do
  sample  'C:\wavs\samples\A3143_synthwave\LTSW_105_Fruitloop\LTSW_105_E_Fruitloop_Strings1.wav',
    amp: amp_str ,start: 0.5, finish: 0.6
    sleep 0.5
  #  sleep 3.5
  #end
end

amp_cutting = 6
live_loop :cutting ,sync: :drums do
  sleep 3
  use_synth :supersaw
  play_chord chord(:c5,:major) ,amp: amp_cutting ,release: 0.2
  sleep 4
  use_synth :supersaw
  play_chord chord(:c5,:major) ,amp: amp_cutting ,release: 0.2
  sleep 1
end

amp_melo = 2
live_loop :melo ,sync: :drums do
  use_synth :square
  use_synth_defaults cuttoff:rrand(60,80), release: 0.1
  with_fx :reverb do
    with_fx :bitcrusher, phase:0.5 do
      play :C4 ,amp: amp_melo
      sleep 4
      play :E4,amp: amp_melo
      sleep 0.25
      play :E4,amp: amp_melo
      sleep 0.5
      play :E4,amp: amp_melo
      sleep 0.25
      play :E4,amp: amp_melo
      sleep 0.5
      play :D4,amp: amp_melo
      sleep 0.5
      play :C4,amp: amp_melo
      sleep 2
    end
  end
end

#sleep 4
#sample  'C:\wavs\samples\voice\dailyrec_001.wav' ,amp:1.5 


