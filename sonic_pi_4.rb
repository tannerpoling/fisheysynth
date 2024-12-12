pitch_vals = { 1 => [37, 39, 42, 44, 46, 49], 2 => [49, 51, 54, 56, 58, 61], 3 => [61, 63, 66, 68, 70, 73]}
$base_entry = 1
synth = :chipbass

live_loop :change_root do
  use_real_time
  msg_in = sync "/osc*/change_root"
  if $base_entry == pitch_vals.keys.length
    $base_entry = 1
  else
    $base_entry = $base_entry + 1
  end
end

live_loop :pi_note0 do
  idx = 0
  pick = rand(3) + 1
  pick = pick.to_i
  pitch = pitch_vals.fetch(pick)[idx]
  #pitch = pitch_vals.fetch($base_entry)[idx]
  use_real_time
  use_synth synth
  msg_in = sync "/osc*/pi_note0"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play pitch, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #sleep 0.25
end

live_loop :pi_note1 do
  idx = 1
  pick = rand(3) + 1
  pick = pick.to_i
  pitch = pitch_vals.fetch(pick)[idx]
  #pitch = pitch_vals.fetch($base_entry)[idx]
  use_real_time
  use_synth synth
  msg_in = sync "/osc*/pi_note1"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play pitch, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #play 70, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #sleep 0.25
end

live_loop :pi_note2 do
  idx = 2
  #pitch = pitch_vals.fetch($base_entry)[idx]
  pick = rand(3) + 1
  pick = pick.to_i
  pitch = pitch_vals.fetch(pick)[idx]
  use_real_time
  use_synth synth
  msg_in = sync "/osc*/pi_note2"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play pitch, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #sleep 0.25
end

live_loop :pi_note3 do
  idx = 3
  #pitch = pitch_vals.fetch($base_entry)[idx]
  pick = rand(3) + 1
  pick = pick.to_i
  pitch = pitch_vals.fetch(pick)[idx]
  use_real_time
  use_synth synth
  msg_in = sync "/osc*/pi_note3"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play pitch, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #sleep 0.25
end

live_loop :pi_note4 do
  idx = 4
  #pitch = pitch_vals.fetch($base_entry)[idx]
  pick = rand(3) + 1
  pick = pick.to_i
  pitch = pitch_vals.fetch(pick)[idx]
  use_real_time
  use_synth synth
  msg_in = sync "/osc*/pi_note4"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play pitch, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #sleep 0.25
end

live_loop :pi_note5 do
  idx = 5
  #pitch = pitch_vals.fetch($base_entry)[idx]
  pick = rand(3) + 1
  pick = pick.to_i
  pitch = pitch_vals.fetch(pick)[idx]
  use_real_time
  use_synth synth
  msg_in = sync "/osc*/pi_note5"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play pitch, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  #sleep 0.25
end