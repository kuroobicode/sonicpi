use_bpm 120

# coded by Niko_14 crazy noise
live_loop :tb do
  with_fx :reverb, room:1 do
    with_fx :krush,res:0.7 do
      synth :fm,amp:1.25,release:4,attack:4,cuttoff:(line 70,90,steps:20).look
      sleep 8
    end
  end
end

# following I'm coding
live_loop :bass, sync: :tb do
  use_synth :tb303
  play_pattern_timed [:r,:E2],[0.75,0.25],amp:0.5,release:0.1
end
live_loop :rif, sync: :tb do
  use_synth :supersaw
  use_synth_defaults amp:0.1, attack:0.2 ,release:2 ,cuttoff: rrand(60,80)
  play :E4
  sleep 0.5
  play :Fs4,release: 1
  sleep 4
  play :E4
  sleep 0.5
  play :B3 ,release: 1
  sleep 3
end
live_loop :riff ,sync: :tb do
  use_synth :blade
  use_merged_synth_defaults amp:1, cuttoff: rrand(60,80) ,release: 1.5
  with_transpose 24 do
    with_fx :flanger do
      play_pattern_timed [:E3,:r,:Fs3,:r],[0.25,0.25,0.25,0.25]
      play_pattern_timed [:r,:E3,:r],[0.25,0.5,0.25]
      play_pattern_timed [:E3,:Ds3,:E3,:r],[0.5,0.25,0.25,1]
    end
  end
end
amp_drum = 1
amp_drum_hh = 3
live_loop :kick do
  sample :bd_tek, amp: amp_drum, cutoff: 60
  sleep 1
end

live_loop :snares do
  sleep 1
  sample :sn_dub, amp: amp_drum, start: 0.15, finish: 0.28, rate: 0.25
  sleep 1
end

live_loop :hh, syn: :kick do
  sample :drum_cymbal_closed, amp:amp_drum_hh, rate: rrand(1.9, 2.1), cutoff: rrand(80, 110), pan: rrand(-0.25, 0.25)
  sleep 0.25
end
