# Welcome to Sonic Pi v3.1

use_bpm 100
live_loop :drums do
  sample  'C:\wavs\samples\A1871_hiphop\DWB_WAV_LOOPS\DWB_DRUMS\DWB_100_Drums_Freedom.wav', amp:3 ,rate: 1 , finish:0.8
  sleep 4
end

live_loop :keys_rhoes ,sync: :drums do
  sleep 2
#  sample  'C:\wavs\samples\A1871_hiphop\DWB_WAV_LOOPS\DWB_MUSICAL_ELEMENTS\DWB_90_C_Purple_RhodesNormal.wav',
#    amp: 3 ,start: 0.1, finish: 0.13
  sleep 1.5
  #with_fx :slicer ,phase:0.5 do
#    sample  'C:\wavs\samples\A1871_hiphop\DWB_WAV_LOOPS\DWB_MUSICAL_ELEMENTS\DWB_90_C_Purple_RhodesNormal.wav',
#      amp: 3 ,start: 0.2, finish: 0.21
    sleep 0.5
  #end
end


live_loop :syn ,sync: :drums do
  
  with_fx :slicer, phase: 0.5 do
    sleep 3
    sample :mehackit_robot1 ,amp:4
    sleep 1
  end
end

amp_noise = 2
live_loop :noise ,sync: :drums do
  
  sleep 1
  #sample :mehackit_robot3 ,amp: amp_noise
  sleep 1
  
  #sample :mehackit_robot2,amp: amp_noise
  sleep 2
  
  #sample :vinyl_rewind , start: 0.5 ,finish: 0.8 ,amp: amp_noise
  #sample :vinyl_backspin ,amp: amp_noise
  sleep 4
end

live_loop :vois_2 ,sync: :drums do
  
  sleep 1
  #sample  'C:\wavs\samples\voice\f_yossya.wav' ,amp:1
  sleep 1
  
  #sample  'C:\wavs\samples\voice\f_un_no.wav' ,amp:1
  sleep 2
  
  sample  'C:\wavs\samples\voice\train\trainmaster.wav' ,amp:5, start:0.71, finish:0.87
  sleep 2
  
end
