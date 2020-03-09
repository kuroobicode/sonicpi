use_bpm 180

# samples ###############################################################
gt1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sullivan King Metal Electronic 2/SLK_metal_electronic_2/SLK_guitar/SLK_guitar_rhythm/SLK_guitar_pierce_my_veil_8bar_180_C.wav"
gt2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sullivan King Metal Electronic 2/SLK_metal_electronic_2/SLK_guitar/SLK_guitar_rhythm/SLK_guitar_win_or_lose_8bar_180_C.wav"
gt3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sullivan King Metal Electronic/SLK_sample_pack/SLK_guitar/SLK_guitar_one_shots/SLK_guitar_effect_more_feedback.wav"

dr_intro1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Alien Weaponry 2 - Modern Bass Essentials/LOOPS/Loops_-_Drum_Fills/AW2_DrumFill_175bpm_10.wav"
dr_intro2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Alien Weaponry 2 - Modern Bass Essentials/LOOPS/Loops_-_Drum_Fills/AW2_DrumFill_175bpm_4.wav"
dr_intro3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Alien Weaponry 2 - Modern Bass Essentials/LOOPS/Loops_-_Drum_Fills/AW2_ProcessedDrumFill_175bpm_10.wav"

dr1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Travis Barker Drum Kit/TRAVIS_BARKER_sample_pack/TRAVIS_BARKER_drums/TRAVIS_BARKER_drum_loops/TRAVIS_BARKER_drum_loop_tom_boi_160.wav"
stick = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Debo Band - Ethiopian Music/splice-export__debo-band-ele_edited/loop/Drums/RT_Debo_Band_Stick_Loop_Drums_Adam_Clark_100_C#_Minor_loop.wav"

# intro ###############################################################
#sample stick
#sleep 2

amp_dr_into = 2
amp_dr_into = 0
live_loop :dr_intro ,delay: 10 do
  
  4.times do
    sample dr_intro1 ,beat_stretch: 8 ,finish: 0.75 ,amp: amp_dr_into
    sleep 4
  end
  sample dr_intro1 ,beat_stretch: 8 ,amp: amp_dr_into
  sleep 4
  sample dr_intro2 ,amp: amp_dr_into * 1.5
  
end

# riff gt ###############################################################
amp_riff = 1
#amp_riff = 0
live_loop :riff do
  sample gt1 ,amp: amp_riff
  sleep 15
  sample gt3 ,amp: amp_riff ,finish: 0.5
  sleep 1
end

amp_amp_riff_gru = 1.5
amp_amp_riff_gru = 0
live_loop :riff_gru , sync: :riff do
  #sample gt2 ,amp: amp_amp_riff_gru
  sample gt1 ,amp: amp_amp_riff_gru ,rate: -1
  sleep 16
end

amp_riff2 = 1
#amp_riff2 = 0
live_loop :riff2 , sync: :riff do
  sample gt3 ,amp: amp_riff2
  sleep 16
end



# drum ###############################################################
amp_dr1 = 2
#amp_dr1 = 0
live_loop :dr1 ,delay: 34 do
  #sample :drum_cymbal_soft ,amp: amp_dr1
  sample dr1 ,amp: amp_dr1 , beat_stretch: 8
  sleep 8
end

amp_dr2 = 1
amp_dr2 = 0
live_loop :dr2 , sync: :riff do
  sample :drum_cymbal_soft ,amp: amp_dr2
  sleep 1
end


# synth ###############################################################
# Arturia CZ-V [Keys Sweet Dynamics]
vel_synth = 120
#vel_synth = 0
live_loop :dream_synth do
  use_real_time
  use_midi_defaults port: "loopmidi_port", channel: 1 ,vel: vel_synth
  
  sleep 2
  midi :C4
  sleep 2
  midi :D4
  sleep 2
  midi :E4
  sleep 1.5
  midi :C4
  sleep 1
  sleep 1.5
  midi :B3
  sleep 1
  midi :C4
  sleep 1
  midi :A3
  sleep 0.5
  midi :G3
  sleep 0.5
  sleep 0.5
  midi :F3
  sleep 1
  midi :E3 ,sustain: 2
  sleep 1.5
  
end

# Arturia Synclavier V [Morphing Chorus]
# By Hand


# synth ###############################################################

live_loop :dream_synth_tmp do
  use_synth :saw
  use_synth_defaults amp: 0 ,release: 1
  
  sleep 2
  play :C4
  sleep 2
  play :D4
  sleep 2
  play :E4
  sleep 1.5
  play :C4
  sleep 1
  sleep 1.5
  play :B3
  sleep 1
  play :C4
  sleep 1
  play :A3
  sleep 0.5
  play :G3
  sleep 0.5
  sleep 0.5
  play :F3
  sleep 1
  play :E3
  sleep 1.5
  
end
