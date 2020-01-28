
use_bpm 120

amp_kick = 1
#amp_kick = 0
live_loop :kick do
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      sample :bd_tek, amp: amp_kick ,cuttoff: 40 , rpitch: 0.1
    end
  end
  sleep 1
end

amp_snare = 2
#amp_snare = 0
live_loop :snare ,sync: :kick do
  sleep 1
  sample :elec_snare ,amp: amp_snare ,rate: 0.7 , start: 0.5
  sleep 1
end

live_loop :hh ,sync: :kick do
  sleep 0.5
  sample :drum_cymbal_pedal ,finish: 0.1
  sleep 0.5
end


flr_n1 = true
live_loop :rythm ,sync: :kick do
  use_synth :tech_saws
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: 1 , release: 0.1
  with_fx :flanger do
    print beat
    if(flr_n1 == true) then
      with_fx :reverb, mix: 0.3, room: 0.8 do
        with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
          play :E3 ,amp: 5
        end
      end
    end
    sleep 1.5
    play :A3 ,amp: 2
    sleep 0.5
    play_pattern_timed [:E2,:E2,:D2,:D2,:E2,:E2,:D2,:D2],(stretch 0.125,8), release: 0.1
  end
  flr_n1 = !flr_n1
  #sleep 1
end

amp_bass_fm = 1
live_loop :funky1 ,sync: :kick do
  use_synth :fm
  #  play :A3 ,amp: 1
  sleep 1.5
  #  play :A3 ,amp: 1
  sleep 0.5
  play_pattern_timed [:E2,:E2,:D2,:D2,:E2,:E2,:D2,:D2],(stretch 0.25,8) ,amp: amp_bass_fm
end

amp_bass_iplayed = 3
#amp_bass_iplayed = 0
bass =  'C:\wavs\samples\iplayed\bass_20200127_1.wav'
live_loop :mero2 ,sync: :kick do
  with_fx :band_eq do
    sample bass ,amp: amp_bass_iplayed ,start: 0, finish: 0.15
    sleep 2.5
    sample bass ,amp: amp_bass_iplayed ,start: 0.4
    sleep 1.5
  end
end

# pad
amp_pad1 = 3
amp_pad1 = 1
#amp_pad1 = 0
live_loop :pad1 ,sync: :kick do
  use_synth :blade
  use_synth :pnoise
  use_synth_defaults cutoff: rrand(80, 110) ,amp: amp_pad1
  with_fx :pitch_shift, pitch_dis:0.03 do
    play :B4 ,release: 7
    sleep 7
    play :C5 ,release: 1
    sleep 1
    play :G4
    sleep 0.5
    play :A4
    sleep 0.5
    sleep 7
  end
end

amp_pad2 = 1
#amp_pad2 = 0
live_loop :pad2 ,sync: :kick do
  use_synth :saw
  use_synth :noise
  use_synth_defaults cutoff: rrand(80, 110) , attack: 0.1 ,amp: amp_pad2
  with_transpose 12 do
    with_fx :slicer ,phase:0.5 do
      with_fx :pitch_shift, pitch_dis:0.02 do
        play :E5 ,release: 7
        sleep 7
        play :C5 ,release: 1
        sleep 1
        #play :D5
        #sleep 8
        4.times do
        play :D5
        sleep 2
        end
      end
    end
  end
end


