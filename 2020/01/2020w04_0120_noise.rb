
use_bpm 120

live_loop :kick do
  
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
#      sample :bd_tek, amp: 1 ,cuttoff: 50
    end
  end
  sleep 1
end

p = 3
live_loop :line do
  sleep 0.5
#  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.tick
  sleep 0.5
end

live_loop :line_up do
  sleep 0.125
#  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.tick ,attack: 0.1, release: 0.1
end

live_loop :rythm do
  use_synth :tech_saws
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: 1 , release: 0.1
  with_fx :flanger do
    play_pattern_timed [:E4,:E3,:r,:E2,:E2,:r,:E2,:E2],(stretch 0.25,8)
  end
  #sleep 1
end

amp_lead = 0
live_loop :lead do
  use_synth :dsaw
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: amp_lead, release: 1, sustain: 0.5
  with_fx :pitch_shift, pitch_dis:0.02 do
    play :Gs3 ,sustain: 0.5
    sleep 5
    #play_pattern_timed [:E3,:Fs3,:Gs3,:E3,:Cs3,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:r,:Fs3,:Gs3,:E3,:r,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
    sleep 7
  end
end

amp_lead_noise = 0
live_loop :lead_noise do
  use_synth :cnoise
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: amp_lead_noise, release: 1, sustain: 0.5
  with_fx :pitch_shift, pitch_dis:0.02 do
    play :Gs3 ,sustain: 0.5
    sleep 5
    #play_pattern_timed [:E3,:Fs3,:Gs3,:E3,:Cs3,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:r,:Fs3,:Gs3,:E3,:r,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
    sleep 7
  end
end

cd = [(ring(:E3,:A4,:D5)),(chord(:D4, :major7)),(chord(:G4, :major7))
      ].ring

cd = [(ring(:E3,:A4,:B5)),(chord(:A4, :major7)),(chord(:Fs4, :minor)),(chord(:B4, :major))
      ].ring

amp_chord1 = 2
live_loop :sea, sync: :kick do
  use_synth :prophet
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(1, 4), amp: amp_chord1
  with_fx :distortion, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      with_transpose -12 do
          print cd
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 3.5
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 4
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 0.5
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 8
      end
    end
  end
end

amp_chord2 = 2
live_loop :sea2, sync: :kick do
  use_synth :blade
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(1, 4), amp: amp_chord2
  with_fx :distortion, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      with_transpose -24 do
          print cd
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 1.5
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 2
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 0.5
          play_chord cd.tick, attack: 0.1, release: 4, sustain: 2
          sleep 10
      end
    end
  end
end
