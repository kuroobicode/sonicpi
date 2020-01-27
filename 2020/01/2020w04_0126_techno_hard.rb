
use_bpm 120

amp_kick = 1
#amp_kick = 0
live_loop :kick do
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      sample :bd_tek, amp: amp_kick ,cuttoff: 40 , rpitch: 0.3
    end
  end
  sleep 1
end

p = 3
live_loop :line_up do
  sleep 0.125
  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.tick ,attack: 0.1, release: 0.1
end

amp_snare = 1
#amp_snare = 0
live_loop :snare ,sync: :kick do
  sleep 1
  sample :elec_snare ,amp: amp_snare
  sleep 1
end

live_loop :hh ,sync: :kick do
  sleep 0.5
  sample :drum_cymbal_pedal
  sleep 0.5
end

amp_line = 1
#amp_line = 0
live_loop :line do
  sleep 0.5
  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.tick ,amp: amp_line
  sleep 0.5
end

amp_voice = 0.7
#amp_voice = 0
live_loop :voice do
  sleep 4
  with_fx :echo do
    sample 'C:\wavs\samples\A1871_hiphop\DWB_SOUNDS_&_FX\DWB_MUSICAL_SHOTS\DWB_G_Vox.wav' ,amp: amp_voice ,start: 0.5
    #sample 'C:\wavs\samples\A1871_hiphop\DWB_SOUNDS_&_FX\DWB_MUSICAL_SHOTS\DWB_G_Vox.wav' ,amp: amp_voice
  end
  sleep 4
end


rs = 0.25
cf_fr = 100
amp_noise1 = 1
#amp_noise1 = 0
live_loop :noise1 ,sync: :kick do
  
  with_fx :ixi_techno, cutoff_max:cf_fr do
    use_synth :pluck
    play_pattern_timed [:C1,:C1,:C1,:C1],[0.25,0.25,0.25,0.25],amp:amp_noise1,release:0.5
    play_pattern_timed [:C1,:C1,:C1,:C1],[0.25,0.25,0.25,0.25],amp:amp_noise1,release:0.25
    play_pattern_timed [:C1,:C1,:C1,:C1],[0.25,0.25,0.25,0.25],amp:amp_noise1,release:0.25
    play_pattern_timed [:Eb1,:Eb1,:Eb1,:F1],[0.25,0.25,0.25,0.25],amp:amp_noise1,release:0.5
  end
end

amp_gt = 2
#amp_gt = 0
live_loop :guitar ,sync: :kick do
  use_synth :prophet
  sleep 3.25
  with_fx :distortion ,mix: 1 do
    play_chord ring(:A1,:D1) ,release: 4 ,amp: amp_gt
  end
  sleep 4.75
end