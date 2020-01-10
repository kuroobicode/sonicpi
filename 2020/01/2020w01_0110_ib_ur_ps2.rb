# Arturia Synti V [Pulius]

live_loop :wave do
  use_synth :noise
  play_pattern_timed [:G3,:D4,:A4,:r],[0.25,0.25,0.75,1.25],release: 3, cutoff: rrand(60, 120), amp:0.1
  sleep 6
end

live_loop :bell do
  use_synth :hollow
  play_pattern_timed [:G3,:D4,:A4,:r],[0.25,0.25,0.75,0.25],release: 3, cutoff: rrand(60, 120), amp:2
  sleep 2
  play_pattern_timed [:A5,:D4,:r,:D4],[0.25,0.25,0.5],release: 3, cutoff: rrand(60, 120), amp:2
  sleep 2
end

amp_syn = 0.0
live_loop :syn do
  use_synth :tri
  if one_in(8)
    play_pattern_timed [:A5,:G5,:D5],[0.25,0.25,0.25], cutoff: rrand(40, 90), amp: amp_syn
  else
    play_pattern_timed [:B5,:G5,:D5],[0.25,0.25,0.25], cutoff: rrand(40, 90), amp: amp_syn
  end
  #amp_syn += 0.01
  if amp_syn > 0.25 then
    amp_syn = 0.25
  end
end


use_bpm 120

master = (ramp *range(0, 1, 0.01))
kick_volume = 2
bass_volume = 1
snare_volume = 1

kick_cutoffs = range(50, 80, 0.5).mirror
live_loop :kick do
  if (spread 1, 4).tick then
    sample :bd_tek, amp: master.look * kick_volume,
      cutoff: kick_cutoffs.look
  end
  sleep 0.25
end

define :snare do |amp|
  sample :drum_snare_soft, amp: amp, start: 0.15, finish: 0.35, rate: 0.7
end

live_loop :snares do
  sleep 1
  snare 1 * master.tick * snare_volume
  sleep 1
end

live_loop :bassline do
  sync :kick
  with_synth :fm do
    7.times do
      play_pattern_timed [:G1,:r,:G1,:r],[0.5,0.25,0.25,0.75,2], amp:bass_volume, divisor: 1, depth: 2.5
    end
    play_pattern_timed [:G1,:r,:G1,:B1,:r,:C2,:r],[0.5,0.25,0.25,0.25,1.25,0.125,0.125], amp:bass_volume, divisor: 1, depth: 2.5
  end
end


