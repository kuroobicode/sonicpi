use_bpm 140

# samples ###############################################################
gt1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fear The Sounds Presents Fear the Rock ft. Sullivan King and KJ Sawka/sk_guitar/SK_guitar_loops_rhythm/SK_guitar_loop_rhythm_epicenter_140_E.wav"
gt2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sullivan King Metal Electronic/SLK_sample_pack/SLK_guitar/SLK_guitar_one_shots/SLK_guitar_effect_hardcore_low_F.wav"
gt3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sullivan King Metal Electronic/SLK_sample_pack/SLK_guitar/SLK_guitar_loops/SLK_guitar_loop_electric_simple_sustain_high_140_F.wav"
gt4 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fear The Sounds Presents Fear the Rock ft. Sullivan King and KJ Sawka/sk_guitar/SK_guitar_loops_rhythm/SK_guitar_loop_rhythm_roadhouse_140_C.wav"

dr1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Travis Barker Drum Kit/TRAVIS_BARKER_sample_pack/TRAVIS_BARKER_drums/TRAVIS_BARKER_drum_loops/TRAVIS_BARKER_drum_loop_not_pretty_134.wav"
dr2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Travis Barker Drum Kit/TRAVIS_BARKER_sample_pack/TRAVIS_BARKER_drums/TRAVIS_BARKER_drum_loops/TRAVIS_BARKER_drum_loop_break_29_beat_groove_140.wav"
dr3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sullivan King Metal Electronic/SLK_sample_pack/SLK_drums/SLK_drum_fills/SLK_drum_fill_anaconda_150.wav"

v1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Voices of Rage/Voices_of_Rage/Soundiron_-_Voices_Of_Rage_-_Splice/Phrases/Aaron/Death/Breakable/Soundiron_VORage_Phrase_Aaron_Death_Breakable_B4_08.wav"
v2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Voices of Rage/Voices_of_Rage/Soundiron_-_Voices_Of_Rage_-_Splice/Phrases/Aaron/Spoken/Simplicity/Soundiron_VORage_Phrase_Aaron_Spoken_Simplicity_E1_40.wav"
v3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Voices of Rage/Voices_of_Rage/Soundiron_-_Voices_Of_Rage_-_Splice/Phrases/Evan/Scream/Breakable/Soundiron_VORage_Phrase_Evan_Scream_Breakable_B4_08.wav"


# intro ###############################################################
#sample dr3
#sleep 4
#sample v1

# riff gt ###############################################################
amp_riff = 1
amp_riff = 0
live_loop :riff do
  sample gt1 ,amp: amp_riff ,finish: 0.5
  sleep 7.5
  sample gt2 ,amp: amp_riff * 0.5
  sleep 3.5
  sample gt3 ,amp: amp_riff
  sleep 5
end

amp_amp_riff_gru = 1
amp_amp_riff_gru = 0
live_loop :riff_gru , sync: :riff do
  sample gt3 ,amp: amp_amp_riff_gru ,beat_stretch: 16
  sleep 16
end

amp_riff2 = 0.5
amp_riff2 = 0
live_loop :riff2 , sync: :riff do
  with_fx :slicer ,mix: 0.25 do
    with_fx :autotuner ,mix: 0.5 do
      sample gt4 ,amp: amp_riff2
    end
  end
  sleep 16
end

amp_riff3 = 1
#amp_riff3 = 0
live_loop :riff3 , sync: :riff do
  with_fx :ping_pong ,mix: 0.25, feedback: 0.9 do
    sample gt3 ,amp: amp_riff3 ,beat_stretch: 16 ,finish: 0.5
    sleep 16
  end
end


# drum ###############################################################
amp_dr1 = 2
amp_dr1 = 0
live_loop :dr1 ,sync: :riff do
  sample :drum_cymbal_soft ,amp: amp_dr1
  sample dr1 ,amp: amp_dr1 ,beat_stretch: 64
  sleep 64
end

amp_dr3 = 1
#amp_dr3 = 0
live_loop :dr3 , sync: :riff do
  sample :drum_cymbal_soft ,amp: amp_dr3
  sleep 1
end

amp_dr2 = 1
#amp_dr2 = 0
live_loop :dr2 , sync: :riff do
  sample dr2 ,amp: amp_dr2
  sleep 16
end

# brass or synth ########################################################
amp_brass1 = 2
#amp_brass1 = 0
live_loop :brass1 ,sync: :riff do
  use_synth :tech_saws
  use_synth_defaults amp: amp_brass1
  with_fx :pitch_shift, pitch_dis:0.01 do
    #    with_fx :ixi_techno, mix: 0.01, room: 0.2 do
    play :A2, attack: 7
    #    end
  end
  sleep 16
end

amp_brass2 = 5
#amp_brass2 = 0
live_loop :brass2 ,sync: :riff do
  sleep 7.5
  use_synth_defaults amp: amp_brass2
  with_fx :pitch_shift, pitch_dis:0.01 do
    with_fx :ixi_techno, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.05, decay: 0.5, phase: 0.75 do
        use_synth :tech_saws
        play_chord ring(:E3,:B3,:E4) ,attack: 1 ,amp: amp_brass2
      end
    end
  end
  sleep 8.5
end

# voice ########################################################
#sample v2 ,amp: 2

