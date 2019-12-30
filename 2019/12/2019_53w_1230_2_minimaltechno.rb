
use_debug false
use_bpm 130

master = (ramp *range(0, 1, 0.01))
kick_volume = 1
bass_volume = 1
revbass_volume = 1
snare_volume = 1
hats_volume = 0.5
open_hats_volume = 1
synth_volume = 1
pad_volume = 1
beep_volume = 0.5

kick_cutoffs = range(50, 80, 0.5).mirror # A LFO for the poor
live_loop :kick do
  if (spread 1, 4).tick then # 4-on-the-floor
    sample :bd_tek, amp: master.look * kick_volume,
      #sample :elec_beep, amp: 1,
      cutoff: kick_cutoffs.look
  end
  sleep 0.25 # 16th note heartbeat
end

define :snare do |amp|
  sample :sn_dub, amp: amp, start: 0.15, finish: 0.35, rate: 0.25
end

live_loop :snares do
  sleep 1
  snare 1 * master.tick * snare_volume
  sleep 1
end

live_loop :snare_break do
  sync :snares
  sleep 15.75
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      snare 0.5 * master.tick * snare_volume
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
        play :d1, amp: hats_volume * master.tick,
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
        play :d1, decay: 1, amp: master.tick * hats_volume
      end
    end
  end
  sleep 1
end

open_hats_cutoffs = range(120, 130, 0.5).mirror
live_loop :open_hats do
  sync :kick
  with_fx :echo, amp: open_hats_volume * master.look,
  mix: 0.4, decay: 4, phase: 0.75 do
    with_fx :hpf, cutoff: open_hats_cutoffs.tick do
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
      amp: bass_volume * 5 * master.tick,
      #amp:1,
      divisor: 1, depth: 2.5,
      _slide:1, _slide_shape: 4
  end
  sleep 6
  play_pattern_timed [:E1, :D1, :C1, :D1],[0.5,0.5,0.5,0.5],
    amp: bass_volume * 5 * master.tick,
    #amp:1,
    divisor: 1, depth: 2.5,
    _slide:1, _slide_shape: 3
  sleep 8
end



dchord = chord(:d2, :minor, num_octaves: 3)
synth_cutoffs = range(60, 100, 0.5).mirror
synth_rhythm = (ring 1.5, 1.5, 1)
synth_transpositions = (stretch 0, 36) + (stretch -12, 6) + (stretch 12, 6)
synth_phases = (stretch 0.75, 15) + [0.25]
synth_pans = (ring -0.5, 0.5)
live_loop :synth do
  sync :kick
  ch = invert_chord(dchord, rand_i(3))
  sleep synth_rhythm.tick
  with_fx :echo, amp: synth_volume * master.look, mix: 0.3,
  decay: 8, phase: synth_phases.look do
    with_fx :pan, pan: synth_pans.look do
      with_fx :reverb, room: 0.7, damp: 0.8 do
        with_synth_defaults attack: 0.05, release: 0.3 do
          with_transpose synth_transpositions.look do
            with_synth :sine do
              play_chord ch
            end
            cutoff = synth_cutoffs.look
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

live_loop :riff2, sync: :kick do
  with_fx :ixi_techno, phase:0.5 do
    dchord = chord(:d3, :minor, num_octaves: 3)
    ch = invert_chord(dchord, rand_i(3))
    use_synth :tech_saws
    sleep 8
    with_fx :reverb ,amp:4 do
      cnt_echo = 1
      rrand(2,8).times do
	play_chord ch, attack: 0.2, amp:0.4 / cnt_echo
	sleep 0.5 * cnt_echo
        cnt_echo += 1
      end
    end 
    sleep 8
  end
end

#amp_cnt = 0.01
amp_cnt = -100
#amp_cnt = 2.01
live_loop :hh ,sync: :kick do
  #stop
  print amp_cnt
  with_fx :distortion do
  with_fx :pan, pan: 0.5 do
    sample :ambi_sauna, start: 0.2, finish: 0.225, amp: amp_cnt
    sleep 1
  end
end
  amp_cnt +=0.01
end

beep_notes = (ring :d2, :f2, :g2, :d2, :e2, :d3)
live_loop :beeps do
  sync :kick
  sleep 0.5
  with_fx :distortion do
    with_synth :beep do
      play beep_notes.tick, amp: beep_volume * master.look,
        decay: 0.2, release: 0.1
    end
  end
  sleep 0.5
end