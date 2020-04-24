
amp_silky_sea = 0
amp_silky_sea = rrand(0.5,0.9)

cnt_sea = 0
cd = chord(:Eb4, :major7)
live_loop :silky_sea do
  if cnt_sea%2 == 0 then
    #cd = chord(:A4, :m)
  else
    # cd = chord(:Eb4, :major7)
  end
  use_synth :hollow
  use_synth_defaults cutoff: rrand(70, 110), release: rrand(1, 4)
  with_fx :panslicer, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      with_fx :reverb, mix: 0.64 do
        with_fx :echo, mix: 0.8 do
          play_chord cd, attack: 4, release: 7, amp: amp_silky_sea
          sleep 8
        end
      end
    end
  end
  cnt_sea += 1
end

live_loop :bell do
  use_synth :chipbass
  play_pattern_timed [:Eb3,:F3,:A3,:C4],[0.5,0.5,0.75,1.25],release: 3, cutoff: rrand(60, 120), amp:0.1
  sleep 6
end

amp_mellow = 0
#amp_mellow = 0.3
live_loop :mellow do
  use_synth :hollow
  [1, 3, 6, 4].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :Bb, :major, 3, invert: i) , amp: amp_mellow
      sleep 0.25
    end
  end
  sleep rrand(8,12)
end

#
amp_riser_saw = 0.04
#amp_riser_saw = 0
live_loop :saw do
  use_synth :tech_saws
  play_chord ring(:F4,:G4) ,amp: amp_riser_saw ,sustain: 1
  sleep 0.75
  play_chord ring(:F4,:A4) ,amp: amp_riser_saw ,sustain: 1
  sleep 1
  play_chord ring(:F4,:Bb4) ,amp: amp_riser_saw ,sustain: 1
  sleep 1
  play_chord ring(:A4,:C5) ,amp: amp_riser_saw ,sustain: 1
  sleep 1
end

#
amp_riser_pad = 0.04
#amp_riser_pad = 0
live_loop :pad do
  use_synth :blade
  with_transpose 12 do
    play_chord ring(:F4,:G4) ,amp: amp_riser_pad ,sustain: 1 ,attack: 1 ,release: 2
  end
  sleep 2
  play_chord ring(:F4,:C5) ,amp: amp_riser_pad ,sustain: 1 ,attack: 1 ,release: 2
  sleep 4
end


# drum ###############################################################

use_bpm 120

amp_kick =3
amp_bass = 0
amp_snare = 0.5

live_loop :kick do
  sample :bd_gas ,amp: amp_kick,finish: 0.02 ,rate: 0.8
  sleep 1
end

live_loop :snares do
  sleep 1
  sample :drum_snare_soft, amp: amp_snare, start: 0.15, finish: 0.35, rate: 0.7
  sleep 1
end


# bass ###############################################################
live_loop :bassline ,sync: :kick do
  with_synth :fm do
    play_pattern_timed [:F1,:r,:D1,:F1],[0.5,0.5,0.25,0.75,2], amp:amp_bass, divisor: 1, depth: 2.5
  end
end

