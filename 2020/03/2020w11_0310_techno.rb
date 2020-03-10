use_bpm 110


gr1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Acid Synths/PL0247_WAV_ACID_Acid_Synths/Prime_Loops_-_Acid_Synths/Acid_Bass_Loops/Bpm110_G_Plumbum_Bass01.wav"
kick1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sonny Digital Drumkit/SONNY_D_drum_kit/SONNY_D_drums/SONNY_D_kicks/SONNY_D_kick_05.wav"

bs1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Acid Synths/PL0247_WAV_ACID_Acid_Synths/Prime_Loops_-_Acid_Synths/Acid_Bass_Loops/Bpm110_B_Pulsar_Bass01.wav"
bs2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Acid Synths/PL0247_WAV_ACID_Acid_Synths/Prime_Loops_-_Acid_Synths/Acid_Bass_Loops/Bpm110_G_Sinph_Bass01.wav"

sn1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/drum_loops/lft2_drum_loop_whiplash_snare_128.wav"
sn2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/drum_hits/claps/lft2_clap_one_shot_mid_rmbl.wav"


v1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_stay_focussed_128.wav"
v2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_ghostvox_128.wav"

v1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_stay_focussed_128.wav"
#v1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_deepin_128.wav"
v2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_flip_the_switch_128.wav"
v3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/VOX/TA_MK_VOX_BREATH1_124bpm_Em.wav"
v4 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/RISERS/TA_MK_RISER_18_122bpm_Bm.wav"
v5 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_digital_erasure_128.wav"

fx1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/BASS_LOOPS_/TA_MK_BASS12_124bpm_Dm.wav"
fx2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/vocal_loops/lft2_vocal_loop_radio_cut_128.wav"
fx3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/synth_one-shots/lft2_synth_one_shot_stub_Cm.wav"


pad1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/synth_one-shots/lft2_synth_one_shot_brine_Cm.wav"
pad2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lo-Fi Techno 2/SKU#SM292_-_SM224_-_Lo-Fi_Techno_2/synth_one-shots/lft2_synth_one_shot_Canada_Cm.wav"
pad3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Trademark Series - Mark Knight/Toolroom_Trademark_Series_-_Mark_Knight/ATMOS_LOOPS/TA_MK_ATMOS_18_124bpm_C.wav"


# voice ###############################################################
#sample v1 ,amp: 0.5 , start: 0.75
#sample v3 ,amp: 0.5

# fx ###############################################################

fx1 = 1
fx1 = 0
live_loop :pad1 do
  sample fx1 ,amp: fx1 ,beat_stretch: 8
  sleep 16
end

pad2 = 1
pad2 = 0
live_loop :pad2 do
  sample pad3 ,amp: pad2
  sleep 6
  sample pad1 ,amp: pad2
  sleep 6
  sample pad2 ,amp: pad2
  sleep 6
  sample fx3 ,amp: pad2 ,start: 0.8
  sleep 6
end

amp_sandstorm = 0
live_loop :sandstorm ,sync: :kick do
  sleep 0.5
  sample :ambi_sauna, amp:amp_sandstorm ,start: 0.15, finish: 0.175
  sleep 1
  amp_sandstorm += 0.05
end

# bass ###############################################################
#sample v5
#sample v4
amp_groove = 1
#amp_groove = 0
live_loop :groove do
  #sample gr1 ,amp: amp_groove ,beat_stretch: 16
  sample gr1 ,amp: amp_groove ,beat_stretch: 16 ,rate: -1
  sleep 16
end

#sample v2
amp_bass = 1
#amp_bass = 0
live_loop :bass do
  #sample bs1 ,amp: amp_bass
  sample bs2 ,amp: amp_bass
  sleep 8
end

# drum ###############################################################
amp_kick = 1
#amp_kick = 0
live_loop :kick ,sync: :groove do
  sample kick1 ,amp: amp_kick
  sleep 1
end
amp_sn1 = 1
#amp_sn1 = 0
live_loop :sn1 ,sync: :kick do
  sleep 1
  sample sn1 ,amp: amp_sn1 ,finish: 0.5
  sleep 1
end
amp_sn2 = 1
#amp_sn2 = 0
live_loop :sn2 ,sync: :kick do
  sleep 1
  sample sn2 ,amp: amp_sn2 ,finish: 0.5
  sleep 1
end


