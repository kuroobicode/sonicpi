use_bpm 130

flag_beam = true;
live_loop :kick do
  sample :bd_zome ,amp:2 , rate:0.75
  sleep 1
  sample :elec_hi_snare, amp:2 ,start: 0.1, finish:0.5
  sleep 0.75
  sample :bd_tek ,amp:2
  sleep 1.25
  sample :elec_hi_snare ,amp:1 ,start: 0.1, finish:0.5
  
  if(flag_beam) then
    with_fx :reverb, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
        sample :elec_hi_snare, amp:1.5, rpitch:-12 ,start: 0.1, finish:0.5
      end
    end
  end
  flag_beam = !flag_beam
  
  sleep 1
end


live_loop :beam do
  sync:kick
  sleep 4
  use_synth :dsaw
  #with_fx :krush do
  with_fx :echo do
    play_chord chord(:C3, :minor),release:0.2 , amp: 2
  end
  #end
  
end

p = 3
#amp_fbass = 0
amp_fbass = 3
live_loop :afff do
#  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.choose
  use_merged_sample_defaults release: 0.125 + rrand(0, 0.2), amp: amp_fbass, pan: rrand(-0.5, 0.5) ,cutoff:rrand(20,120)
  sleep 0.25
end

#sample :elec_blup
smp = :elec_blup
amp_smp = 0.75
live_loop :rptn_r1 do
  sync :kick
  sleep 2.5
  sample smp
  use_sample_defaults amp: amp_smp, pan: rrand(-0.5, 0.5) ,cutoff:rrand(60,100) , rpitch:-1
  sample smp, rate:-1
  sleep 1.5
end

#sample :elec_flip
smp2 = :elec_flip
amp_smp2 = 0.5
#amp_smp2 = 0
live_loop :rptn_r2 do
  sync :kick
  sample smp2 ,amp:amp_smp2
  sleep 0.25
  sample smp2 ,amp:amp_smp2
  sleep 0.25
  sample smp2 ,amp:amp_smp2
  sleep 0.25
  sample smp2 ,amp:amp_smp2
  sleep 0.25
  sample smp2 ,amp:amp_smp2
  sleep 0.25
  sample smp2 ,amp:amp_smp2
  sleep 0.5
  sample smp2 ,amp:amp_smp2
  sleep 1
end

#vol_noise = range(0, 5, 0.5).mirror
#vol_noise = [0]
vol_noise = [0,1,2,3,4,5]
live_loop :noise do
  sync :kick
  with_fx :ring_mod do
    #   use_synth :supersaw
    #   play :d3 ,amp:vol_noise.ticks
 #   sample :bass_dnb_f ,amp: vol_noise.tick
  end
  sleep 1
end

amp_fm = 0
#amp_fm = 2
live_loop :funky do
  sync :kick
  use_synth :piano
  use_synth_defaults cutoff: rrand(80, 110), release: rrand(0.5, 2), amp:0.3
  with_fx :flanger do
    with_fx :pitch_shift,pitch_dis:0.03 do
      play_pattern_timed [:Eb3,:F3,:Eb3,:F3,:Eb3,:F3,:Eb3,:F3,:Eb3],[0.5,0.25,0.25,0.25,0.25,0.25,0.5,0.25,0.5], amp:amp_fm, release:0.5
      play_pattern_timed [:Eb3,:F3,:Eb3,:F3,:Eb3,:F3,:Eb3,:F3,:Eb3],[0.5,0.25,0.25,0.25,0.25,0.25,0.5,0.25,0.5], amp:amp_fm, release:0.5
      play :Eb4, amp:amp_fm, release:0.5
      sleep 0.5
      play :F4, amp:amp_fm, release:0.5
      sleep 0.5
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
