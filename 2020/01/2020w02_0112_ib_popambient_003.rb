
live_loop :bas do
  with_transpose 12 do
    use_synth :beep
    with_fx :reverb, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
        play_pattern_timed [:G3,:C4,:E4],[0.125,0.125,0.5] ,amp:0.125
        #play_pattern_timed [:A3],[0.75] ,amp:0.25
        #play_pattern_timed [:G3],[0.75] ,amp:0.25
      end
      sleep 1.5
    end
    
    with_fx :reverb, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.2, decay: 12, phase: 0.75 do
        play_pattern_timed [:E3,:C3],[0.125,0.75] ,amp:0.25
      end
    end
    sleep 2.25
  end
end

live_loop :eff do
  use_synth :dsaw
  with_fx :reverb, mix: 0.3, room: 0.8 do
    use_synth_defaults amp: rrand(0.01,0.07)
    #play_pattern_timed [:E4,:F4,:E4,:r],[0.25,0.5,0.25,0.25]
    sleep 1
  end
  if one_in (4) then
    sleep 1
  end
end

live_loop :mellow do
  use_synth :hollow
  [1, 3, 6, 4].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :f, :major, 3, invert: i) , amp:0.3
      sleep 0.125
    end
  end
  sleep rrand(8,12)
end


use_bpm 120
master = ring(1)
vol_kick = 2
vol_snare = 1
vol_bass = 2
vol_wav = 1

live_loop :bassline do
  sync :kick
  with_synth :fm do
    #play_pattern_timed [:C1,:r,:C1,:F1],[0.5,0.5,0.25,0.75,2], amp: vol_bass, divisor: 1, depth: 2.5 , release: 0.5
    sleep 1
end
end

live_loop :synth do
  sample  'C:\wavs\samples\A3143_synthwave\LTSW_105_Fruitloop\LTSW_105_E_Fruitloop_Strings1.wav', amp: vol_wav, start:0.5, finish: 1
  sleep 2
end

cutoffs_kick = range(50, 80, 0.5).mirror
live_loop :kick do
  if (spread 1, 4).tick then
    #sample :bd_tek, amp: master.look * vol_kick,
    #  cutoff: cutoffs_kick.look
    sleep 1
end
  sleep 0.25
end

define :sn do |amp|
  sample :elec_beep, amp: amp, start: 0.15, finish: 0.35, rate: 0.25
end

live_loop :snares do
  sleep 1
  #sn 1 * master.tick * vol_snare
  sleep 1
end

