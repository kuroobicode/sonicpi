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
  end
  sleep 0.25
end

define :sn do |amp|
  sample :sn_dub, amp: amp, start: 0.1, finish: 0.12, rate: 0.1
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

live_loop :ti, sync: :kick do
  sleep 0.5
  sample :drum_cymbal_closed ,amp:0.05 ,release: 0.01
  sleep 0.5
end


live_loop :bassline do
  use_synth :fm
  use_synth_defaults cutoff: rrand(80, 110), release:0.15
  with_fx :pitch_shift, pitch_dis:0.02 do
    
    # pattern 1
    play_pattern_timed [:G2,:r,:D2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    play_pattern_timed [:F2,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    play_pattern_timed [:r,:r,:A2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    
    # pattern 2
    #play_pattern_timed [:G2,:r,:D2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:F2,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:r,:r,:A2,:r,:A2],[0.25,0.25,0.25,0.15,0.1], amp: master.tick * 2
    
    # pattern 3
    #play_pattern_timed [:G2,:r,:D2,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:F2,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:r,:r,:r,:r],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    #play_pattern_timed [:r,:r,:r,:A2],[0.25,0.25,0.25,0.25], amp: master.tick * 2
    
  end
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
              sleep 8
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
    tmp_chord = chord(:d1, :minor, num_octaves: 3)
    ch = invert_chord(tmp_chord, rand_i(3))
    use_synth :tech_saws
    sleep 12
    with_fx :reverb ,amp:4 do
      cnt_echo = 1
      rrand(2,8).times do
	play_chord ch, attack: 0.2, amp: 0.4/cnt_echo , cuttoff:cuttoff_dark_wave
  sleep rrand(5,8)/10
        cnt_echo += 1
      end
    end 
    sleep 12
  end
end


amp_sp = 0
live_loop :spacy_pad do
  use_synth :saw
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :pitch_shift, pitch_dis:0.01 do
    play_chord (ring :B4,:D5,:A6), amp: amp_sp , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
    sleep 6
    play_chord (ring :B5,:D6,:A7), amp: amp_sp , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
    sleep 10
  end
end

amp_sp2 = 0
live_loop :spacy_pad2 do
  use_synth :saw
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :distortion ,mix:0.5 do
    with_fx :pitch_shift, pitch_dis:0.01 do
      play_chord (ring :B1,:D2,:A3), amp: amp_sp2 , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
      sleep 6
      play_chord (ring :B2,:D3,:A4), amp: amp_sp2 , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
      sleep 10
    end
  end
end


amp_sp3 = 0
live_loop :spacy_pad3 do
  use_synth :saw
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :slicer ,phase: 0.25 do
    with_fx :distortion ,mix:0.5 do
      with_fx :pitch_shift, pitch_dis:0.01 do
        play_chord (ring :G1,:D2,:D3), amp: amp_sp3 , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
        sleep 2
        play_chord (ring :D2,:D3,:G4), amp: amp_sp3 , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
        sleep 10
      end
    end
  end
end

#piano
amp_piano = 0
live_loop :piano do
  use_synth :piano
  use_synth_defaults cuttoff: rrand(60,80)
    with_fx :pitch_shift, pitch_dis:0.01 do
      with_fx :ixi_techno, mix: 0.3, room: 0.8 do
        with_fx :echo, mix: 0.05, decay: 12, phase: 0.75 do
          play :F4 ,amp: amp_piano
          sleep 6
          play_pattern_timed [:G4,:F4,:r],[0.85,0.5,2.65],amp: amp_piano
          sleep 6
        end
       end      
    end
end

smp = 'C:\wavs\samples\KaeruCafe\Dark Grey _ Train Master 2\01 At Green Park Station _ London.wav'
#sample smp ,amp:0.3

