
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
  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.tick
  sleep 0.5
end

live_loop :line_up do
  sleep 0.125
  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.tick ,attack: 0.1, release: 0.1
end

live_loop :rythm do
  use_synth :tech_saws
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: 1 , release: 0.1
  with_fx :flanger do
    play_pattern_timed [:E4,:E3,:r,:E2,:E2,:r,:E2,:E2],(stretch 0.25,8)
  end
  #sleep 1
end


cnt_cn2 = 0
amp_r1 = 0
amp_r2 = 0

live_loop :cn2 , sync: :kick do
  use_synth :tb303
  print cnt_cn2
  case cnt_cn2
  when 0..1 then
    play_chord chord(:d2, :m), amp:0.2, release:0.3,slice:0.1
  when 2..3 then
    play_chord chord(:c2, :maj9), amp:0.3, release:0.5,slice:0.1
  when 4..5 then
    play_chord chord(:e2, :minor), amp:0.4, release:1,slice:0.1
  when 6..7 then
    play_chord chord(:f2, :major7), amp:0.5, release:2,slice:0.5
  when 8..9 then
    play_chord chord(:G2, :m), amp:0.3, release:3,slice:0.5,cuttoff:rrand(70,100)
    play_chord chord(:B2, :m), amp:0.2, attack:1, release:3,slice:0.5,cuttoff:rrand(70,100)
  when 10..Float::INFINITY then
    #play_chord chord(:C3, :major7), cuttoff:rrand(60,100),amp:0.2, release:2,sustain:3
    with_fx :flanger do
      play_chord chord(:G2, :m), amp:0.3, release:4,slice:0.5,cuttoff:rrand(70,100)
      play_chord chord(:D3, :m), amp:0.3, attack:2, release:4,slice:0.5,cuttoff:rrand(70,100)
    end
  end
  sleep 4
  cnt_cn2 +=1
  amp_r1 += 0.1
  amp_r2 += 0.2
  cnt_cn2 = 1
  amp_r1 = 0.1
  amp_r2 = 0.2
end

amp_lead = 0.5
live_loop :lead do
  use_synth :dsaw
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: amp_lead, release: 1, sustain: 0.5
  with_fx :reverb ,phase:0.3 do
    with_fx :flanger ,decay: 2, feedback:0.015 do
      with_fx :pitch_shift, pitch_dis:0.01 do
        play :Gs3 ,sustain: 0.5
        sleep 5
        play_pattern_timed [:E3,:Fs3,:Gs3,:E3,:Cs3,:B2],[0.5,0.5,0.5,0.5,0.5,0.5], sustain: 0.5
        #   play_pattern_timed [:r,:Fs3,:Gs3,:E3,:r,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
        sleep 7
      end
    end
  end
end

amp_lead_noise = 1
live_loop :lead_noise do
  use_synth :cnoise
  use_merged_synth_defaults cuttoff:rrand(40,80) ,amp: amp_lead_noise, release: 1, sustain: 0.5
  with_fx :pitch_shift, pitch_dis:0.02 do
    #    play :Gs3 ,sustain: 0.5
    sleep 5
    #play_pattern_timed [:E3,:Fs3,:Gs3,:E3,:Cs3,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
    #    play_pattern_timed [:r,:Fs3,:Gs3,:E3,:r,:B2],[0.5,0.5,0.5,0.5,0.5,0.5]
    sleep 7
  end
end

cd = [(ring(:E3,:A4,:B5)),(chord(:A4, :major7)),(chord(:Fs4, :minor)),(chord(:B4, :major))
      ].ring

amp_chord1 = 1.5
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
