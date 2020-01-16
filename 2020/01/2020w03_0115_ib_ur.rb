use_bpm 130

flag_beam = true;
cuttoff_kick = 120

live_loop :kick do
  
  sample :bd_zome ,amp:2 , rate:0.75 ,cutoff:cuttoff_kick ,lpf: 90, release:0.1
  sample :bd_boom ,amp:15 , release:3
  sleep 0.75
  sample :bd_zome ,amp:2 , rate:0.75 ,cutoff:cuttoff_kick ,lpf: 90, release:0.1
  sleep 0.25
  sample :elec_hi_snare, amp:2 ,start: 0.1, finish:0.5
  sleep 0.5
  sample :bd_zome ,amp:2 , rate:0.75,cutoff:cuttoff_kick, release:0.1
  sample :bd_boom ,amp:15 , release: 1 , lpf: 60
  sleep 0.25
  sample :bd_zome ,amp:2 , rate:0.75,cutoff:cuttoff_kick, release:0.1
  sleep 0.25
  sample :bd_zome ,amp:2 , rate:0.75,cutoff:cuttoff_kick, release:0.1
  sleep 0.5
  sample :bd_zome ,amp:2 , rate:0.75,cutoff:cuttoff_kick, release:0.1
  sleep 0.5
  
  if(flag_beam) then
    sample :elec_hi_snare ,amp:1 ,start: 0.1, finish:0.5
    with_fx :ixi_techno, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.05, decay: 12, phase: 0.75 do
        sample :elec_hi_snare, amp:2, rpitch:-12 ,start: 0.1, finish:0.5
      end
    end
    sleep 1
  else
    sample :elec_hi_snare ,amp:1 ,start: 0.1, finish:0.5
    sleep 0.5
    sample :elec_blup ,amp:1 ,start: 0.2, finish:0.5
    sleep 0.5
    
  end
  flag_beam = !flag_beam
  
end

amp_bass = 0
live_loop :bass, sync: :kick do
  with_fx :pan, mix: 0.3, room: 0.8 do
    use_synth :fm
    sleep 0.5
    play :E3 ,amp: amp_bass ,release:0.1
    sleep 0.5
    play :E3 ,amp: amp_bass ,release:0.1
    sleep 0.25
    play :D3 ,amp: amp_bass ,release:0.1
    sleep 0.25
  end
end

live_loop :beam do
  sync:kick
  sleep 4
  use_synth :dsaw
  with_fx :krush do
    with_fx :echo do
      play_chord chord(:C3, :minor),release:0.2 , amp: 2
    end
  end
  
end


n1 = :F2
amp_n1 = 0
#amp_n1 = 0.25
live_loop :rptn do
  sync :kick
  use_synth :dsaw
  with_fx :pitch_shift,pitch_dis:0.03 do
    with_fx :ixi_techno do
      sleep 1
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.25], amp:amp_n1, release:0.5
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.25], amp:amp_n1, release:0.5
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.25], amp:amp_n1, release:0.5
      play_pattern_timed [n1,n1,n1,n1],[0.25, 0.25, 0.25, 0.2], amp:amp_n1, release:0.5
    end
  end
end

amp_ns = 2
live_loop :noise_sub, sync: :kick do
  with_fx :ixi_techno, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.05, decay: 12, phase: 0.75 do
      sample :elec_hi_snare, amp:amp_ns, rpitch:-12 ,start: 0.1, finish:0.5
    end
  end
  sleep 2
end

amp_fm = 1
live_loop :funky ,sync: :kick do
  use_synth :piano
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(0.05, 0.2), amp:0.3
  with_fx :flanger do
    with_fx :pitch_shift,pitch_dis:0.03 do
      with_transpose 12 do
      play_pattern_timed [:C3,:r,:G3,:r], [0.25,0.25,0.25,0.25], amp:amp_fm, release:0.5
      play_pattern_timed [:C2,:D2,:r,:D2,:Ds2,:r], [0.25,0.25,0.5,0.25,0.25,0.5], amp:amp_fm, release:0.5
      play_pattern_timed [:Ds2,:F2,:r,:F2,:G2,:r], [0.25,0.25,0.5,0.25,0.25,0.5], amp:amp_fm, release:0.5
      play_pattern_timed [:G2,:Ab2,:r,:Bb2,:C3,:r], [0.25,0.25,0.5,0.25,0.25,0.5], amp:amp_fm, release:0.5
      end
    end
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
  amp_cnt +=0.05
end
