use_bpm 120

live_loop :kick do
  #sample :elec_hi_snare ,amp:1 ,start: 0.1, finish:0.5
  sleep 1
end

live_loop :riff_1 ,sync: :kick do
  use_synth :prophet
  with_fx :pitch_shift, pitch_dis:0.01 do
    play_pattern_timed [:Eb3,:r,:Eb3,:Eb3,:Bb3,:Eb3,:r,:Eb3],[0.25], release: 0.25
  end
end

p = 3
amp_fbass = 1
#amp_fbass = 3
live_loop :afff, sync: :kick do
  sample :bass_hit_c, rpitch: [p*0,p*4,p*5,p*8,p*12,p*24].ring.choose
  #use_merged_sample_defaults release: 0.125 + rrand(0, 0.2), amp: amp_fbass, pan: rrand(-0.5, 0.5) ,cutoff:rrand(20,120)
  use_sample_defaults release: 0.125 + rrand(0, 0.2), amp: amp_fbass, pan: rrand(-0.5, 0.5) ,cutoff:rrand(20,120)
  sleep 0.25
end

#2.times do
live_loop :lead ,sync: :kick ,delay:10 do
  #live_loop :lead ,sync: :kick  do
  
  amp_lead_1 = 1.2
  flg_lead_1 = true
  
  2.times do
    use_synth :blade
    use_synth_defaults cutoff: rrand(80, 110), release:0.5, amp: amp_lead_1
    with_fx :pitch_shift, pitch_dis:0.02 do
      
      #play_pattern_timed [:G4,:r,:G4,:F4,:G4,:Bb4,:Eb4],[2,0.5,0.5,0.5,0.5,1,1]
      play_pattern_timed [:G4,:r,:r,:F4,:r,:Bb4,:Eb4],[2,0.5,0.5,0.5,0.5,1,1]
      
      #play_pattern_timed [:r,:Eb4,:C5,:Bb4,:G4],[0.5,0.5,0.5,0.5,2]
      play_pattern_timed [:r,:Eb4,:C5,:r,:G4],[0.5,0.5,0.5,0.5,2]
      
      if (flg_lead_1 == true) then
        #play_pattern_timed [:r,:F4,:G4,:C4,:Bb3,:r],[0.5,0.5,0.5,0.5,2,0.5]
        play_pattern_timed [:r,:F4,:r,:C4,:Bb3,:r],[0.5,0.5,0.5,0.5,2,0.5]
        play_pattern_timed [:r,:Bb4],[0.5,1]
        
      else
        #play_pattern_timed [:r,:F4,:G4,:C4,:Eb4,:r],[0.5,0.5,0.5,0.5,2,0.5]
        play_pattern_timed [:r,:F4,:r,:C4,:Eb4,:r],[0.5,0.5,0.5,0.5,2,0.5]
        play_pattern_timed [:r,:Bb4],[0.5,1]
      end
      #end
    end
    flg_lead_1 = !flg_lead_1
    
  end
  
  amp_lead_2 = 1.2
  #live_loop :lead_2 ,sync: :kick do
  use_synth :tech_saws
  use_synth_defaults cutoff: rrand(80, 110), attack:0.2, release:0.5, amp: amp_lead_2
  with_fx :pitch_shift, pitch_dis:0.02 do
    
    #play_pattern_timed [:Eb4,:r,:Eb4,:Eb4,:F4,:Eb4,:C4,:Bb3,:r],[1,0.5,0.5,1,1,1,1,1,1]
    #play_pattern_timed [:G4,:Eb4,:D4,:Eb4,:F4,:r],[1,1,1,1,1,3]
    #play_pattern_timed [:Eb4,:r,:Eb4,:Eb4,:F4,:Eb4,:C4,:Bb3,:r],[1,0.5,0.5,1,1,1,1,1,1]
    #play_pattern_timed [:G4,:Eb4,:D4,:G3,:C4,:r],[1,1,1,1,1,3]
    
    play_pattern_timed [:Eb4,:r,:r,:Eb4,:F4,:Eb4,:C4,:Bb3,:r],[1,0.5,0.5,1,1,1,1,1.5,0.5]
    play_pattern_timed [:G4,:Eb4,:D4,:Eb4,:F4,:r],[1,1,1,1,1,3]
    play_pattern_timed [:Eb4,:r,:r,:Eb4,:F4,:Eb4,:C4,:Bb3,:r],[1,0.5,0.5,1,1,1,1,1.5,0.5]
    play_pattern_timed [:G4,:Eb4,:D4,:G3,:C4,:r],[1,1,1,1,1,3]
    
  end
  #sleep 2.5
  
end

amp_arp = 0
amp_arp = 0.15
live_loop :arp ,sync: :kick do
  
  with_fx :panslicer ,phase: 0.5 do
    use_synth :supersaw
    play_pattern_timed ring(:G3, :Bb3, :F4), [0.25,0.5] ,amp: amp_arp, release:0.1
  end
  
end

amp_pad = 0
#amp_pad = 0.5
live_loop :pad ,sync: :kick do
  sleep 2
  with_fx :reverb do
    sample :bass_thick_c ,amp: amp_pad ,release: 8
    sleep 2
    sample :bass_thick_c ,amp: amp_pad/2 ,release: 8 ,rpitch: 5
    sleep 2
    sample :bass_thick_c ,amp: amp_pad/4 ,release: 8 ,rpitch: 12
    sleep 2
    sample :bass_thick_c ,amp: amp_pad/8 ,release: 8 ,rpitch: 17
    sleep 2
  end
  sleep 6
end

