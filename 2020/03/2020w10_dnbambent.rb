use_bpm 180

dr1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/The Temple Of Breaks/WAV_ACID_The_Temple_Of_Breaks/The_Temple_Of_Breaks/Drum_Loops/GT_Break_178.wav"

fx1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Bedroom Beats & Lofi Hip-Hop Vol. 2/CPA_Bedroom_Beats_&_Lofi_HipHop_Vol_2/Ambience_&_FX/BB2_90_fx_ambience_birds_n_kids.wav"
fx2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Capsun x Julez Jadon On The Run - Mallorca/CPA_Capsun_x_Julez_Jadon_On_The_Run_Mallorca/Natural_Ambience_&_Foley/Natural_Ambience/CXJ_140_natural_ambience_kids_playing.wav"
sea = "C:/Users/kuroobicodes/Documents/Splice/Samples/packs/Neo Soul The Love Experiment/Loops/Instrument_Loops/Atmospheres/SO_NS_90_atmosphere_cantaloupe_Dm.wav"
fx3 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Harris Cole Sound Pack/HC_sample_pack/HC_chords/HC_chord_loop_thicker_80.wav"
fx4 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Prince Chrishan  Kold Kutz (Sample Pack)/PRINCE_CHRISHAN_sample_pack/PRINCE_CRISHAN_tonal/PRINCE_CHRISHAN_tonal_loop_howdouwantit_02_160_Amaj.wav"

gt1 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Televisor Nu Disco Dynamite/GUITAR/DISTORTED_CHORDS/DGC_Amaj.wav"
gt2 = "C:/Users/kuroobicode/Documents/Splice/Samples/packs/Team Supreme - All Stars Vol. 1/TS_sample_pack/TS_GCODY_/GCODY_guitars/GCODY_pedalsteel/GCODY_pedalsteel_chord/GCODY_pedalsteel_chord_AM7.wav"

# drum ###############################################################
amp_dr1 = 1
amp_dr1 = 0
live_loop :dr1 do
  sample dr1 ,amp: amp_dr1
  sleep 16
end

# texture ###############################################################
amp_texture = 1
live_loop :texture do
  sample fx1 ,amp: amp_texture
  sleep 24
  sample fx2 ,amp: amp_texture
  sleep 24
end

amp_wave = 1
live_loop :wave do
  sample sea ,amp: amp_wave
  sleep 32
end

# fx ###############################################################
#sample gt2 ,amp: 0.4
sample fx3 ,amp: 0.7 ,attack: 2
#sample fx4

# built-in synth ###############################################################
amp_fm = 0.2
amp_fm = 0
live_loop :bell do
  use_synth :chipbass
  use_synth_defaults release: 2, amp: amp_fm
  with_fx :echo do
    with_fx :pitch_shift ,pitch_dis: 0.001 do
      play_pattern_timed [:Bb3,:F3,:Eb3,:D3],[1,1,1.5,2.5]
    end
  end
  sleep 6
end

amp_drops = 0.1
amp_drops = 0
live_loop :drops do
  use_synth :beep
  with_fx :reverb ,room: 0.5 do
    use_synth_defaults cutoff: rrand(60, 120) ,amp:amp_drops
    play_pattern_timed [:A4,:Eb4,:F4,:Eb4,:C4,:D4],[1.5,1.5,1.5,1.5,1,1],release: 3, cutoff: rrand(60, 120)
    play_pattern_timed ring(:Bb3,:A3,:A3,:Bb3,:A3,:G3,:G3,:F3,:r).shuffle, ring(0.5,0.5,1,1,0.5,1,1,0.5).shuffle
  end
  sleep 3
end

cnt_sparkling = 0
amp_sparkling = 0.02
live_loop :silky_sparkling do
  if cnt_sparkling < 0 then
    sleep 4
  elsif cnt_sparkling%2 == 0 then
    with_fx :reverb, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
        play_pattern_timed [:D5,:Bb5,:D5],[0.25,0.25,0.5], amp: amp_sparkling
      end
    end
    sleep 1.5
  elsif
    with_fx :reverb, mix: 0.3, room: 0.8 do
      with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
        play_pattern_timed [:F5,:D5,:A3],[0.25,0.25,0.5], amp: amp_sparkling
      end
    end
    sleep 1.5
  end
  # end
  cnt_sparkling += 1
end

# piano - pad1 - fx5 -
# BbM7 - Dbm6 - AM7
amp_drops2 = 0.5
#amp_drops2 = 0
live_loop :drops2 do
  use_synth :fm
  use_synth_defaults cutoff: rrand(60, 120) ,amp:amp_drops2
  5.times do
    play_pattern_timed [:B4,:Bb4,:Gb4,:Eb4],[0.5],release: 3, cutoff: rrand(60, 120)
    sleep 1
  end
  4.times do
    play_pattern_timed [:A4,:Ab4,:E4,:Db4],[0.5],release: 3, cutoff: rrand(60, 120)
    sleep 1
  end
  
  3.times do
    play_pattern_timed [:Ab4,:E4,:Db4,:A3],[0.5],release: 3, cutoff: rrand(60, 120)
    sleep 1
  end
end

