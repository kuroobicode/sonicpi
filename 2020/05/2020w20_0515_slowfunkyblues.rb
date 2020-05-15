use_bpm 90

dr1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Organic Vibes - Vinyl Beats & Soul/Origin_Sound_-_Organic_Vibes/Drum_Loops/Full/OS_OGV_85_Drum_Loop_29__Full_.wav"
dr1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Straight to Tape Analog Sounds from The Dip/THE_DIP_labeled_processed/THE_DIP_drums/THE_DIP_tascam_388/THE_DIP_grooves/THE_DIP_drum_loop_still_good_funky_sixteenths_388_93.wav"
dr1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/DEAD/DEAD/LOOPS/CDS_DEAD_88_DRUM_LOOP_GROOVES_SMACK_A_SNARE_TAMBO_1.wav"
dr1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Wolfgang Gartner Flashback Funk Pack feat. Josh Charles/wg_loops/WG_drum_loops/WG_drum_loop_old_drum_machine_95.wav"


key_b3 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Jesus on the Mainline - Blues/splice-export__jesus-on-the-mainline-jump-right-in/one_shot/Keyboards/RT_Jesus_on_the_Mainline_Wurlitzer_Long_3_Keyboards_Pascal_Le_Beouf_93.5_G_Minor_Dorian_one_shot.wav"
wulitzer_break = "C:/Users/mtkg/Documents/Splice/Samples/packs/Jesus on the Mainline - Blues/splice-export__jesus-on-the-mainline-jump-right-in/one_shot/Keyboards/RT_Jesus_on_the_Mainline_Wurlitzer_Riff_1_Keyboards_Pascal_Le_Beouf_93.5_G_Minor_Dorian_one_shot.wav"
ep = "C:/Users/mtkg/Documents/Splice/Samples/packs/Funk & Soul Kits/Unmute_Funk_And_Soul_Kits/KIT_9_Emin/Loops/KIT9_90_Electric_Piano_Wha_Emin.wav"
b1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Straight to Tape Analog Sounds from The Dip/THE_DIP_labeled_processed/THE_DIP_bass/THE_DIP_grooves/THE_DIP_bass_loop_rubber_ducky_131_Eb.wav"
bs1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Wolfgang Gartner Flashback Funk Pack feat. Josh Charles/wg_loops/WG_bass_loops/WG_bass_loop_wah_115_Bmin.wav"
bs2 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Wolfgang Gartner Flashback Funk Pack feat. Josh Charles/wg_loops/WG_bass_loops/WG_bass_loop_slap_01_115_Cmin.wav"
bs3 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Wolfgang Gartner Flashback Funk Pack feat. Josh Charles/wg_loops/WG_synth_loops/WG_synth_loop_bass_04_stab_95_Fmin.wav"

ch_synth_groove = "C:/Users/mtkg/Documents/Splice/Samples/packs/70s Movie Funk by Basement Freaks/Black_Octopus_Sound_-_70s_Disco_Funk_by_Basement_Freaks/LOOPS/Keys_Loops/90_-_Am_-_Jupiter_&_Guitar.wav"

fx_clavi = "C:/Users/mtkg/Documents/Splice/Samples/packs/70s Movie Funk by Basement Freaks/Black_Octopus_Sound_-_70s_Disco_Funk_by_Basement_Freaks/LOOPS/Keys_Loops/90_-_Am_-_Wah_Clavi_Loop_02.wav"
fx_sax1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/70s Movie Funk by Basement Freaks/Black_Octopus_Sound_-_70s_Disco_Funk_by_Basement_Freaks/LOOPS/Brass_Loops/90_-_Am_-_Sax_Loop_02.wav"
fx_sax2 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Galactic Sax Vol. 1/One_Shots/RARE_galactic_sax_wet_arpegio_reverb_horns_woodwind.wav"
fx_sax3 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Galactic Sax Vol. 1/One_Shots/RARE_galactic_sax_layered_melody_wet_reverb_saxophone_woodwind.wav"


gt1 = "C:/Users/mtkg/Documents/Splice/Samples/packs/Straight to Tape Analog Sounds from The Dip/THE_DIP_labeled_processed/THE_DIP_guitar/THE_DIP_grooves/THE_DIP_guitar_loop_shipping_off_170_E.wav"
gt_slide = "C:/Users/mtkg/Documents/Splice/Samples/packs/Jesus on the Mainline - Blues/splice-export__jesus-on-the-mainline-jump-right-in/one_shot/Guitar/RT_Jesus_on_the_Mainline_Slide_Guitar_Riff_1_Guitar_Simon_Kafka_93.5_G_Minor_Dorian_one_shot.wav"

voice = "C:/Users/mtkg/Documents/Splice/Samples/packs/Wolfgang Gartner Flashback Funk Pack feat. Josh Charles/wg_one_shots/WG_vocals/WG_vocal_vocoder_party_115_Cmin.wav"


# end ###############################################################
#sample fx_sax3 ,amp: 1.5
#sample fx_clavi
#sample fx_sax1

# drum ###############################################################
amp_dr = 3
#amp_dr = 0
live_loop :dr do
  #sample dr1 ,amp: amp_dr ,beat_stretch: 16
  #sleep 16
  sample dr1 ,amp: amp_dr ,beat_stretch: 8
  sleep 8
end

# break ###############################################################
# wurlizer break
amp_brk = 0.5
#amp_brk = 0
live_loop :brk do
  sample key_b3 ,amp: amp_brk
  sleep 2.75
  
  if (tick%4 == 0)
    sample gt_slide ,amp: amp_brk * 0.5
  end
  
  if (tick%2 == 0)
    sample wulitzer_break ,amp: amp_brk
  end
  sleep 5.25
end

# A ###############################################################
amp_bs1 = 6
#amp_bs1 = 0
live_loop :bass ,delay: 8 do
  sample bs1 ,amp: amp_bs1, beat_stretch: 16 ,rate: 1
  sleep 16
end

# C ###############################################################
amp_synth_groove = 1
amp_synth_groove = 0
live_loop :synth_groove ,sync: :bass do
  sample ch_synth_groove ,amp: amp_synth_groove, beat_stretch: 32 ,rate: 1
  sleep 32
end

# B ###############################################################
amp_bs2 = 2
amp_bs2 = 0
live_loop :bass2 do
  with_fx :ixi_techno ,phase: 0.25 do
    sample bs2 ,amp: amp_bs2, beat_stretch: 8 ,rate: 1
  end
  sleep 8
end

# keys ###############################################################
amp_ep = 3
amp_ep = 0
live_loop :ep do
  sample ep ,amp: amp_ep ,beat_stretch: 8
  sleep 8
end

# ending ###############################################################


