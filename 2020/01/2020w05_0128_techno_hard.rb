use_bpm 120

master = ring(1)
vol_kick = 2
vol_bass = 1
vol_snare = 1
vol_hat = 0.5
vol_synth = 1

cutoffs_kick = range(50, 80, 0.5).mirror
live_loop :kick do
  if (spread 1, 4).tick then
    sample :bd_tek, amp: master.look * vol_kick,
      cutoff: cutoffs_kick.look
    #, rate: 0.1
  end
  sleep 0.25
end

define :sn do |amp|
  sample :elec_hi_snare, amp: amp, start: 0.15, finish: 0.18, rate: 0.1
end

live_loop :snares do
  sleep 1
  sn 1 * master.tick * vol_snare
  sleep 1
end

live_loop :snare_break do
  sync :snares
  sleep 15.75
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.25 do
      sn 0.5 * master.tick * vol_snare
    end
  end
  sleep 0.25
end

live_loop :hats ,sync: :kick do
  
  if (spread 3, 8).tick then
    # (spread 3, 8) produces this pattern: * _ _ * _ _ * _
    with_fx :rhpf, cutoff: 125, res: 0.8 do
      with_synth :pnoise do
        play :d1, amp: 8 * master.tick, attack: 0.05, decay: 0.08, release: 0.1
      end
    end
  end
  sleep 0.25
end


live_loop :bassline ,sync: :kick do
  use_synth :fm
  use_synth_defaults cutoff: rrand(80, 110), release:0.15
  with_fx :pitch_shift, pitch_dis:0.02 do
    
    # pattern 1
    #play_pattern_timed [:G2,:r,:D2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:F2,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:r,:r,:A2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    
    # pattern 2
    play_pattern_timed [:G2,:r,:D2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    play_pattern_timed [:F2,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    play_pattern_timed [:r,:r,:A2,:r,:A2],[0.25,0.25,0.25,0.15,0.1], amp: master.tick * 2
    
    # pattern 3
    #play_pattern_timed [:G2,:r,:D2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:F2,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:r,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:r,:r,:r,:A2],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    
  end
end

live_loop :bass_line2 do
  use_synth :fm
  use_synth_defaults cutoff: rrand(60, 80), release:0.15, amp: 1 ,depth: 1.5
  with_fx :pitch_shift, pitch_dis:0.02 do
    play_pattern_timed [:D2,:G2,:G2,:F2,:G2],[0.25]
    sleep 2.75
    play_pattern_timed [:r,:G2,:r],[0.25,0.5]
  end
end


# bass 16
# happy_noise
amp_bass_line3 = 2
live_loop :bass_line3 do
  sleep 6
  use_synth :chipbass
  play_pattern_timed [:A1,:C2,:D2,:r],[0.25,0.25,0.25,0.75], amp: amp_bass_line3 , divisor: 1, depth: 2.5 , release: 0.15
  sleep 1
end

tmp_rsynth = chord(:E2, :minor7, num_octaves: 3)
cutoff_rsynth = range(60, 100, 0.5).mirror
sleeptime_rsynth = (ring 1.5, 1.5, 1)
transposition_rsynth = (stretch 0, 36) + (stretch -12, 6) + (stretch 12, 6)
phase_rsynth = (stretch 1, 15) + [0.25]
pan_rsynth = (ring -0.5, 0.5)
live_loop :rhythm_synth do
  sleep 1
  sync :kick
  ch = invert_chord(tmp_rsynth, rand_i(3))
  sleep sleeptime_rsynth.tick
  with_fx :echo, amp: vol_synth * master.look, mix: 0.3,
  decay: 8, phase: phase_rsynth.look do
    with_fx :pan, pan: pan_rsynth.look do
      with_fx :reverb, room: 0.7, damp: 0.8 do
        with_synth_defaults attack: 0.05, release: 0.3 do
          with_transpose transposition_rsynth.look do
            with_synth :mod_tri do
              play_chord ch
            end
            cutoff = cutoff_rsynth.look
            with_fx :ixi_techno, cutoff_min: cutoff,
            cutoff_max: cutoff - 30, phase: 1, res: 0.3 do
              with_synth :dull_bell do
                play_chord ch, attack: 0.1
              end
              sleep 7
            end
          end
        end
      end
    end
  end
end

# beaty noise pad
cd = [(ring(:D3,:Fs4,:A5)),(chord(:A4, :major7)),(chord(:C4, :major7))
      ].ring

amp_chord1 = 0.4
live_loop :sea, sync: :kick do
  use_synth :tech_saws
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(1, 4), amp: amp_chord1
  with_fx :distortion, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      with_transpose -12 do
        print cd
        play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
        sleep 4
        play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
        sleep 3
        play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
        sleep 9
      end
    end
  end
end

amp_chord2 = 0.4
live_loop :sea2, sync: :kick do
  use_synth :blade
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(1, 4), amp: amp_chord2
  with_fx :distortion, mix: 0.75 do
    with_fx :hpf, cutoff: 70 do
      with_transpose -24 do
        print cd
        sleep 4
        play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
        sleep 5
        play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
        sleep 3
        play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
        sleep 4
      end
    end
  end
end
