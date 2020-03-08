use_bpm 150

kick1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_drums/FM_kicks/FM_kick_standard.wav"
dr_break = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_drums/FM_drum_loops/FM_drum_loop_sauce_short_build_150.wav"
clap = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_drums/FM_claps/FM_clap_edm_reverb.wav"
hh = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Jackin' Tech House/Function_Loops_-_Jackin_Tech_House/FL_JTH_Drum_Loops/FL_JTH_04_Hats_Loop_125.wav"

sy1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_synths/FM_synth_loops/FM_synth_loop_future_150_C.wav"
fx1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_synths/FM_synth_loops/FM_synth_loop_can_t_lose_150_E.wav"
fx2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_synths/FM_synth_loops/FM_synth_loop_future_stabs_01_144_F.wav"
fx_riser1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Lex Luger Drumkit/Lex_Luger_Drumkit/LL_one_shots/LL_riser_pink.wav"
fx_riser2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Sounds of KSHMR Vol. 1/Sounds_of_KSHMR_Vol_1__FINAL_/KSHMR_FX/Sweeps_Up/Medium/KSHMR_Medium_Sweep_Up_03.aif"
fx3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Synth Shots/SM38_-_Synth_Shots_-_Wav/pads/ss_pads_melancholy_Fmajm6.wav"
fx4 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Neon 80s/Neon_80_s_-_Zenhiser/Loops_-_Synth_&_Instuments/014_Pad_118bpm_Cmin_-_NEON80S_Zenhiser.wav"


pf1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Future Bass Elements/PL0420_ACID_WAV_Future_Bass_Elements/Prime_Loops_-_Future_Bass_Elements/Synth_Loops/Bpm150_C_BandpassPiano._Synth.wav"
v2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Future Bass Elements/PL0420_ACID_WAV_Future_Bass_Elements/Prime_Loops_-_Future_Bass_Elements/Synth_Loops/Bpm150_C_VoxMelody01_Synth.wav"

gt1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/DKVPZ, sample pack/DKVPZ_labeled_processed/DKVPZ_tonal/DKVPZ_melody_loops/DKVPZ_guitar_synth_vocal_loop_150_Bbmin.wav"
v1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Fabian Mazur Sample Pack No. 1/FM_sample_pack/FM_vocals/FM_vocal_others/FM_vocal_other_can_t_lose_this_time_150_E.wav"

# intro ###############################################################
=begin
sample fx2 ,amp: 1
sleep 25
sample fx1 ,attack: 6 ,amp: 1
sleep 10
sample clap
sleep 6
sample v1 ,amp: 1
sample fx1 ,attack: 8 ,amp: 1
sleep 16
sample dr_break ,amp: 1
sleep 8
sample fx_riser1 ,finish: 0.7 ,release: 2
sleep 8
=end


# drum ###############################################################
amp_dr1 = 2
#amp_dr1 = 0
live_loop :drum do
  sample kick1 ,amp: amp_dr1
  sleep 1
end
amp_dr_hats = 0.5
#amp_dr_hats = 0
live_loop :hats do
  sample hh ,amp: amp_dr_hats ,beat_stretch: 16
  sleep 16
end

amp_dr2 = 1
amp_dr2 = 0
live_loop :drum_kick_h do
  sample kick1 ,amp: amp_dr2
  sleep 0.5
end

# fx
#sample fx4 ,amp: 1.5 ,finich: 0.25
#sample fx_riser2

amp_dr3 = 1
amp_dr3 = 0
live_loop :drum_kick_q do
  sample kick1 ,amp: amp_dr3
  sleep 0.25
end

# riff ###############################################################
amp_riff = 1
#amp_riff = 0
live_loop :riff do
  sample sy1 ,amp: amp_riff
  sleep 24
end
live_loop :chord ,sync: :drum do
  use_synth :saw
  play_chord chord(:C4 ,:m7) ,amp: amp_riff*2
  sleep 16
end

amp_chorus = 2
amp_chorus = 0
live_loop :chorus ,sync: :drum do
  sample pf1 ,amp: amp_chorus
  sample v2 ,amp: amp_chorus
  sleep 16
end


