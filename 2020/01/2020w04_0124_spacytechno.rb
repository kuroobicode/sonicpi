

use_bpm 130


n1 = :G4
amp_n1 = 0
#amp_n1 = 0.125
live_loop :rptn do
  #  sync :kick
  use_synth :tri
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(0.5, 2), amp:0.3
  with_fx :panslicer, phase:0.7 do
    with_fx :pitch_shift,pitch_dis:0.03 do
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.25], amp:amp_n1, release:0.5
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.25], amp:amp_n1, release:0.5
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.25], amp:amp_n1, release:0.5
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.2], amp:amp_n1, release:0.5
    end
  end
end

#amp_fm = 0
amp_fm = 1
live_loop :funky do
  sync :kick
  use_synth :fm
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(0.5, 2), amp:0.3
  with_fx :flanger do
    with_fx :pitch_shift,pitch_dis:0.03 do
      play_pattern_timed [:G3,:G3,:D4,:G4,:A4,:G3,:D3,:r],[0.5,0.5,0.5,0.25,0.25,0.25,0.75], amp:amp_fm, release:0.5
      #sleep 4.25
      play_pattern_timed [:A3,:A3,:E4,:A4,:B4,:A3,:E3,:r],[0.5,0.5,0.5,0.25,0.25,0.25,0.5], amp:amp_fm, release:0.5
    end
  end
end

# main pattern1
amp_ste = 0.1
live_loop :ste do
  sync :kick
  use_synth :tri
  with_fx :reverb do
    sleep 0.25
    play :G3, note_slide:1 ,sustain:0 ,amp:amp_ste
    sleep 0.75
    play :A3, note_slide:0.5 ,sustain:1 ,amp:amp_ste
    sleep 1.25
    play :D2, note_slide:2 ,sustain:0,amp:amp_ste
    sleep 3
  end
  
end


master = ring(1)
vol_kick = 3
vol_bass = 1
vol_snare = 0.5
vol_hat = 0.5
vol_synth = 1

amp_sp = 0
live_loop :spacy_pad do
  use_synth :saw
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :pitch_shift, pitch_dis:0.01 do
    play_chord (ring :B4,:D5,:A6), amp: amp_sp , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
    sleep 6
    play_chord (ring :B5,:D6,:A7), amp: amp_sp , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
    sleep 1
  end
end

amp_sp2 = 0.1
live_loop :spacy_pad2 do
  use_synth :saw
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :distortion ,mix:0.5 do
    with_fx :pitch_shift, pitch_dis:0.01 do
      play_chord (ring :B1,:D2,:A3), amp: amp_sp2 , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
      sleep 6
      play_chord (ring :B2,:D3,:A4), amp: amp_sp2 , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
      sleep 1
    end
  end
end

amp_ss = 0
live_loop :spacy_shining do
  use_synth :beep
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :echo, mix: 0.05, decay: 12, phase: 0.75 do
    with_fx :pitch_shift, pitch_dis:0.01 do
      play_pattern_timed [:A5,:As5,:A5,:G5],[0.25,0.25,0.25,0.75], amp:amp_ss, release:0.25
      play_pattern_timed [:A5,:As5,:A5,:G5],[0.25,0.25,0.25,0.75], amp:amp_ss, release:0.25
      play_pattern_timed [:A5,:As5,:A5,:G5],[0.25,0.25,0.25,0.75], amp:amp_ss, release:0.25
      play_pattern_timed [:As5,:C6,:As5,:A5],[0.25,0.25,0.25,0.75], amp:amp_ss, release:0.25
      play_pattern_timed [:As5,:C6,:As5,:A5],[0.25,0.25,0.25,0.75], amp:amp_ss, release:0.25
      play_pattern_timed [:As5,:C6,:As5,:A5],[0.25,0.25,0.25,0.75], amp:amp_ss, release:0.25
    end
  end
end

amp_sp3 = 0.1
live_loop :spacy_pad3 do
  use_synth :saw
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :slicer ,phase: 0.25 do
    with_fx :distortion ,mix:0.5 do
      with_fx :pitch_shift, pitch_dis:0.01 do
        play_chord (ring :G1,:D2,:D3), amp: amp_sp3 , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
        sleep 6
        play_chord (ring :D2,:D3,:G4), amp: amp_sp3 , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
        sleep 1
      end
    end
  end
end

cutoffs_kick = range(50, 80, 0.5).mirror
live_loop :kick do
  if (spread 1, 4).tick then
    #if (beat%2 == 0) then
#    sample :bd_ada, amp: master.look * vol_kick, cutoff: cutoffs_kick.look
    #end
  end
  sleep 0.25
end

define :sn do |amp|
  sample :sn_dub, amp: amp, start: 0.15, finish: 0.25, rate: 0.15
end

live_loop :snares do
  sleep 1
#  sn 1 * master.tick * vol_snare
  sleep 1
end

live_loop :snare_break do
  sync :snares
  sleep 15.75
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
#      sn 0.5 * master.tick * vol_snare
    end
  end
  sleep 0.25
end

live_loop :hats do
  sync :kick
  if (spread 3, 8).tick then
    with_fx :rhpf, cutoff: 125, res: 0.8 do
      with_synth :pnoise do
#        play :d1, amp: vol_hat * master.tick, decay: 0.01, release: 0.1
      end
    end
  end
  sleep 0.25
end

live_loop :noise_hats do
  sync :kick
  with_fx :slicer, mix: 1, phase: 0.25, pulse_width: 0.1 do
    with_fx :hpf, cutoff: 130 do
      with_synth :noise do
        play :d1, decay: 1, amp: master.tick * vol_hat
      end
    end
  end
  sleep 1
end

cutoffs_open_hats_ = range(120, 130, 0.5).mirror
live_loop :open_hats do
  sync :kick
  with_fx :echo, amp: vol_hat * master.look,
  mix: 0.4, decay: 4, phase: 0.75 do
    with_fx :hpf, cutoff: cutoffs_open_hats_.tick do
      with_fx :reverb, mix: 0.4, room: 0.8 do
        sleep 0.5
        sample :drum_cymbal_open, start: 0.2, finish: 0.3, amp: 0.5
        sleep 0.5
      end
    end
  end
end
# Welcome to Sonic Pi v3.1

