use_bpm 130

master = (ramp *range(0, 1, 0.01))
vol_kick = 1
vol_bass = 1
vol_snare = 1
vol_hat = 0.5
vol_synth = 1

cutoffs_kick = range(50, 80, 0.5).mirror
live_loop :kick do
  if (spread 1, 4).tick then
    sample :bd_tek, amp: master.look * vol_kick,
      cutoff: cutoffs_kick.look
  end
  sleep 0.25
end

define :sn do |amp|
  sample :sn_dub, amp: amp, start: 0.15, finish: 0.35, rate: 0.25
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
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      sn 0.5 * master.tick * vol_snare
    end
  end
  sleep 0.25
end

live_loop :hats do
  sync :kick
  if (spread 3, 8).tick then
    # (spread 3, 8) produces this pattern: * _ _ * _ _ * _
    with_fx :rhpf, cutoff: 125, res: 0.8 do
      with_synth :pnoise do
        play :d1, amp: vol_hat * master.tick,
          attack: 0.05, decay: 0.08, release: 0.1
      end
    end
  end
  sleep 0.25
end

live_loop :noise_hats do
  sync :kick
  # Create hi-hats by slicing continuous noise
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

live_loop :bassline do
  3.times do
    sleep 6
    use_synth :fm
    play_pattern_timed [:D1, :F1, :G1, :A1],[0.5,0.5,0.5,0.5],
      amp: vol_bass * 6 * master.tick,
      #amp:1,
      divisor: 1, depth: 2.5,
      _slide:1, _slide_shape: 4
  end
  sleep 6
  play_pattern_timed [:E1, :D1, :C1, :D1],[0.5,0.5,0.5,0.5],
    amp: vol_bass * 6 * master.tick,
    #amp:1,
    divisor: 1, depth: 2.5,
    _slide:1, _slide_shape: 3
  sleep 8
end

tmp_rsynth = chord(:d2, :minor, num_octaves: 3)
cutoff_rsynth = range(60, 100, 0.5).mirror
sleeptime_rsynth = (ring 1.5, 1.5, 1)
transposition_rsynth = (stretch 0, 36) + (stretch -12, 6) + (stretch 12, 6)
phase_rsynth = (stretch 0.75, 15) + [0.25]
pan_rsynth = (ring -0.5, 0.5)
live_loop :rhythm_synth do
  sync :kick
  ch = invert_chord(tmp_rsynth, rand_i(3))
  sleep sleeptime_rsynth.tick
  with_fx :echo, amp: vol_synth * master.look, mix: 0.3,
  decay: 8, phase: phase_rsynth.look do
    with_fx :pan, pan: pan_rsynth.look do
      with_fx :reverb, room: 0.7, damp: 0.8 do
        with_synth_defaults attack: 0.05, release: 0.3 do
          with_transpose transposition_rsynth.look do
            with_synth :sine do
              play_chord ch
            end
            cutoff = cutoff_rsynth.look
            with_fx :ixi_techno, cutoff_min: cutoff,
            cutoff_max: cutoff - 30, phase: 1, res: 0.3 do
              with_synth :dull_bell do
                play_chord ch, attack: 0.1
              end
              sleep 4
            end
          end
        end
      end
    end
  end
end

# everytime changing several parameters
live_loop :dark_wave, sync: :kick do
  cuttoff_dark_wave = rrand(60,100)
  with_fx :ixi_techno, phase:rrand(1,8)/10 do
    tmp_chord = chord(:d2, :minor, num_octaves: 3)
    ch = invert_chord(tmp_chord, rand_i(3))
    use_synth :tech_saws
    sleep 8
    with_fx :reverb ,amp:4 do
      cnt_echo = 1
      rrand(2,8).times do
	play_chord ch, attack: 0.2, amp: 0.4/cnt_echo , cuttoff:cuttoff_dark_wave
	sleep rrand(5,8)/10
        cnt_echo += 1
      end
    end 
    sleep 8
  end
end

amp_cnt = 0.00
live_loop :hh ,sync: :kick do
  #stop
  print amp_cnt
  with_fx :pan, pan: 0.5 do
    sample :ambi_sauna, start: 0.2, finish: 0.225, amp: amp_cnt
    sleep 1
  end
  amp_cnt +=0.00
end

notes_sub_bass = (ring :d2, :f2, :g2, :d2, :e2, :d3)
live_loop :sub_bass do
  sync :kick
  sleep 0.5
  with_fx :distortion do
    with_synth :beep do
      play notes_sub_bass.tick, amp: vol_bass/2 * master.look,
        decay: 0.2, release: 0.1
    end
  end
  sleep 0.5
end