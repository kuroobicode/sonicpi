# Welcome to Sonic Pi v3.1

use_bpm 90


intro = 'C:\wavs\samples\splice\VHB_84_Gm_Loft_Songstarter.wav'
riff1 = 'C:\wavs\samples\splice\VHB_90_Bb_Strange_Piano_1.wav'
riff1_brk1 = 'C:\wavs\samples\splice\VHB_Instrumental_Oneshot_18_Rhodes_Fmaj.wav'
riff1_brk2 = 'C:\wavs\samples\splice\VHB_Instrumental_Oneshot_20_Rhodes_Fmaj.wav'
riff1_brk3 = 'C:\wavs\samples\splice\VHB_Instrumental_Oneshot_29_Trumpet_C.wav'
riff2 = 'C:\wavs\samples\splice\ms2_bs123_sushi_Am.wav'
dr1 = 'C:\wavs\samples\splice\VHB_93_Drum_Loop_Smooth_2.wav'
sn1 = 'C:\wavs\samples\splice\ms2_snr_such.wav'
#bass = 'C:\wavs\samples\splice\VHB_88_F_Jazzy_Bass.wav'
bass1 = 'C:\wavs\samples\PS-35 WAV Funk & RnB\090_ Ease in For The Chill\35t-bas-90E.wav'
bass2 = 'C:\wavs\samples\splice\FMT_-_Bm_-_Getting_Funky_Out_Here.wav'

scratch1 = 'C:\wavs\samples\splice\BRV_Am_your_sensee_Scratch.wav'
scratch2 = 'C:\wavs\samples\splice\BRV_In_the_city_like_this_Scratch.wav'
scratch3 = 'C:\wavs\samples\splice\BRV_My_thing_is_proper_respect_Scratch.wav'
scratch4 = 'C:\wavs\samples\splice\BRV_Put_em_down_Scratch.wav'
scratch5 = 'C:\wavs\samples\splice\BRV_Round_one_Scratch.wav'

#sample intro
#sleep 16

amp_dr1 = 1
#amp_dr1 = 0
live_loop :dr1 do
  sample dr1 ,amp: amp_dr1 ,beat_stretch: 16
  sleep 16
end

amp_riff1 = 1
#amp_riff1 = 0
live_loop :riff1 do
  sample riff1 ,amp: amp_riff1 ,beat_stretch: 16
  sleep 16
end
amp_riff1_brk1 = 1.5
#amp_riff_brk1 = 0
live_loop :riff1_brk1 ,sync: :riff1 do
  sleep 7
  #sleep 7.5
  sample riff1_brk1 ,amp: amp_riff1_brk1 ,finish: 0.1
  sleep 1
  #sleep 0.5
end

# part 1 ################################################
amp_bass1 = 2
#amp_bass1 = 0
live_loop :bass1 ,sync: :dr1 do
  sample bass1 ,amp: amp_bass1 ,rpitch: -1 ,finish: 0.5
  sleep 4
  #sample bass ,amp: amp_bass ,rpitch: -1 ,finish: 0.5
  sleep 4
end

# part 2 ################################################
amp_bass2 = 1
amp_bass2 = 0
live_loop :bass2 ,sync: :dr1 do
  sample bass2 ,amp: amp_bass2 ,beat_stretch: 8
  sleep 8
end

amp_scratch1 = 1
#amp_scratch1 = 0
live_loop :scratch1 ,sync: :dr1 do
  sample scratch4 ,amp: amp_scratch1
  sleep 8
end






