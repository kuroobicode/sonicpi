use_bpm 125

fx1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/BASS_LOOPS_/TA_MK_BASS12_124bpm_Dm.wav"
fx2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/BASS_LOOPS_/TA_MK_BASS9_125bpm_C.wav"
fx3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/synth_one-shots/lft2_synth_one_shot_parallel_wire_Cm9.wav"
fx4 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/synth_one-shots/lft2_synth_one_shot_ancient_F#m.wav"
fx5 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/synth_one-shots/lft2_synth_one_shot_cotton_Fm.wav"
fx6 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_ghostvox_128.wav"

dr = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Modular Landscapes with Sigha/Loops/Drum_Loops/SO_MLS_128_drum_loop_dense_cursher.wav"
sn1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/drum_loops/lft2_drum_loop_whiplash_snare_128.wav"
sn2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/drum_hits/claps/lft2_clap_one_shot_mid_rmbl.wav"

bs = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/bass_loops/lft2_bass_synth_loop_deep_arpdirt_128_Am.wav"

key1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Jesus on the Mainline - Blues/splice-export__jesus-on-the-mainline-jump-right-in/one_shot/Keyboards/RT_Jesus_on_the_Mainline_B3_Short_1_Keyboards_Pascal_Le_Beouf_93.5_G_Minor_Dorian_one_shot.wav"
key2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Jesus on the Mainline - Blues/splice-export__jesus-on-the-mainline-jump-right-in/one_shot/Keyboards/RT_Jesus_on_the_Mainline_Wurlitzer_Short_1_Keyboards_Pascal_Le_Beouf_93.5_G_Minor_Dorian_one_shot.wav"
hm = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Jesus on the Mainline - Blues/splice-export__jesus-on-the-mainline-jump-right-in/one_shot/Horns-and-Reeds/RT_Jesus_on_the_Mainline_Harmonica_2_Horns_and_Reeds_Tim_Emmerick_93.5_G_Minor_Dorian_one_shot.wav"

v1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_deepin_128.wav"
v2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_flip_the_switch_128.wav"
v3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/VOX/TA_MK_VOX_BREATH1_124bpm_Em.wav"
v4 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/RISERS/TA_MK_RISER_18_122bpm_Bm.wav"


# fx ###############################################################
amp_fx1 = 1
#amp_fx1 = 0
live_loop :fx1 do
  sample fx1 ,amp: amp_fx1 ,beat_stretch: 16
  sample fx2 ,amp: amp_fx1 ,beat_stretch: 16
  sleep 16
end

amp_funkyblues = 0.5
amp_funkyblues = 0
live_loop :funkyblues do
  
  sleep 0.5
  sample key1 ,amp: amp_funkyblues
  sleep 1
  sample hm ,amp: amp_funkyblues
  sleep 1
  sample key2 ,amp: amp_funkyblues
  sleep 5.5
  
end

amp_fx3 = 0.5
#amp_fx3 = 0
live_loop :fx3 do
  sample fx3 ,amp: amp_fx3
  sleep 12 + rrand_i(1,8)
end

amp_fx4 = 0.5
amp_fx4 = 0
live_loop :fx4 do
  sleep 8 + rrand_i(1,8)
  sample fx4 ,amp: amp_fx4
  sleep 8 + rrand_i(1,8)
end

# voice ###############################################################
#sample v4
#sample v2 ,amp: 0.5

# bass ###############################################################
amp_bs = 0.5
amp_bs = 0
live_loop :bs ,sync: :fx1 do
  sample bs ,amp: amp_bs ,beat_stretch: 16
  sleep 16
end

# drum ###############################################################
amp_dr = 1
#amp_dr = 0
live_loop :dr ,sync: :fx1 do
  sample dr ,amp: amp_dr ,beat_stretch: 32
  sleep 32
end
amp_sn1 = 1
#amp_sn1 = 0
live_loop :sn1 ,sync: :fx1 do
  sleep 1
  sample sn1 ,amp: amp_sn1 ,finish: 0.5
  sleep 1
end
amp_sn2 = 1
#amp_sn2 = 0
live_loop :sn2 ,sync: :fx1 do
  sleep 1
  sample sn2 ,amp: amp_sn2 ,finish: 0.5
  sleep 1
end

# pad ###############################################################
amp_sp = 0.025
#amp_sp = 0
live_loop :spacy_pad do
  use_synth :sine
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :pitch_shift, pitch_dis:0.01 do
    #play_chord (ring :Bb4,:D5,:A6), amp: amp_sp , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
    #sleep 6
    with_transpose 24 do
      play_chord (ring :Bb5,:D6,:A7), amp: amp_sp , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
    end
    sleep 4
  end
  
end

amp_sp2 = 0.025
#amp_sp2 = 0
live_loop :spacy_pad2 do
  use_synth :tri
  use_synth_defaults cuttoff: rrand(60,80)
  with_fx :distortion ,mix:0.5 do
    with_fx :pitch_shift, pitch_dis:0.01 do
      #play_pattern_timed [:F4,:D4,:A3,:r],[0.25,0.25,1,2.5], amp: amp_sp2 , divisor: 1, depth: 2.5 , attack: 12, release: 0.25
      #sleep 3
      with_transpose 24 do
        play_chord (ring :Bb2,:D3,:A4), amp: amp_sp2 , divisor: 0.1, depth: 2.5 , attack: 12, release: 0.15 , note_slide: 1
        sleep 6
      end
    end
  end
end

