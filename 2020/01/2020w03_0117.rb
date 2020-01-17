# Welcome to Sonic Pi v3.1

use_bpm 130

kick_volume = 4
bass_volume = 2
snare_volume = 1

kick_cutoffs = range(50, 80, 0.5).mirror
live_loop :kick do
  tick
#  sample :bd_tek, amp: kick_volume,
#    cutoff: kick_cutoffs.look
  sleep 1
end

live_loop :snare, sync: :kick do
  sleep 1
 # sample :drum_snare_soft, amp: snare_volume, start: 0.15, finish: 0.25, rate: 0.3
  sleep 1
end
live_loop :snare_break ,sync: :snare do
  sleep 15
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      sample :drum_snare_soft, amp: snare_volume * 0.5, start: 0.15, finish: 0.25, rate: 0.3
    end
  end
  sleep 1
end

# bass line
amp_bass = 0
live_loop :base ,sync: :kick do
  with_synth :fm do
    play_pattern_timed [:r,:G2,:r,:G2,:r,:G2,:r,:A2],[0.5], amp: amp_bass , divisor: 1, depth: 2.5 ,release: 1
    play_pattern_timed [:r,:A2,:r,:A2,:r,:A2,:r,:E2],[0.5], amp: amp_bass , divisor: 1, depth: 2.5 ,release: 1
    play_pattern_timed [:r,:E2,:r,:E2,:r,:E2,:r,:E2],[0.5], amp: amp_bass , divisor: 1, depth: 2.5 ,release: 1
    play_pattern_timed [:r,:E2,:r,:E2,:r,:E2,:Fs2,:G2],[0.5], amp: amp_bass , divisor: 1, depth: 2.5 ,release: 1
    #sleep 4
  end
end

# 2nd wave
cd2 = [(chord(:Eb4, '6')),(chord(:Eb4, :M))
       ].ring

cd2 = [(ring :Db4,:D4,:Fb4),(chord(:G4, :major7))
       ].ring

amp_wave = 0.3
live_loop :wave, sync: :kick do
  use_synth :tri
  with_fx :hpf, cutoff: 60 do
    with_fx :reverb, mix: 0.8 do
      tcd2 = cd2.tick
      4.times do
        sleep 1
        play_chord tcd2, attack: 0.03, amp: amp_wave * rrand(1,1.5)
      end
    end
  end
end

# 3rd lead
amp_lead = 0
live_loop :lead ,sync: :kick do
  use_synth :blade
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(2, 4), amp: amp_lead
  with_fx :pitch_shift, pitch_dis:0.01 do
    play_pattern_timed [:G4,:r,:G4,:Fs4,:D4,:r],[2,0.5,0.5,0.5,1.5,1.5]
    play_pattern_timed [:B3,:D4,:E4,:r],[0.5,0.5,2,0.5]
    sleep 6
  end
  #sleep 2.5
end

amp_lead2 = 3
live_loop :lead2 ,sync: :kick do
  use_synth :blade
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(2, 4), amp: amp_lead2
  with_fx :pitch_shift, pitch_dis:0.01 do
    play_pattern_timed [:G4,:r,:G4,:Fs4,:A4,:r],[2,0.5,0.5,0.5,1.5,1]
    play_pattern_timed [:B4,:Fs4,:r,:G4,:r],[0.5,0.5,0.5,2,0.5]
    sleep 6
  end
  #sleep 2.5
end

amp_lead3 = 3
live_loop :lead3 ,sync: :kick do
  use_synth :supersaw
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(1, 2), amp: amp_lead3
  with_fx :pitch_shift, pitch_dis:0.01 do
    sleep 10
    play_pattern_timed [:B4,:Fs4,:r,:G4,:r],[0.5,0.5,0.5,2,0.5]
    sleep 2
  end
  #sleep 2.5
end


# g maj
cd = [(ring(:E3,:A4,:D5)),(chord(:D4, :major7)),(chord(:G4, :major7))
      ].ring

amp_chord = 3
live_loop :sea, sync: :kick do
  use_synth :prophet
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(1, 4), amp: amp_chord
  with_fx :panslicer, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      with_fx :reverb, mix: 0.64 do
        with_fx :echo, mix: 0.8 do
          print cd
          play_chord cd.tick, attack: 0.1, release: 4
          sleep 3.5
          play_chord cd.tick, attack: 0.1, release: 4
          sleep 4
          play_chord cd.tick, attack: 0.1, release: 4
          sleep 8.5
        end
      end
    end
  end
end

