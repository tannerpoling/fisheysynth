live_loop :flibble do
  sample :bd_haus, rate: 1
  sleep 2
end

live_loop :pi_note0 do
  use_real_time
  use_synth :prophet
  msg_in = sync "/osc*/pi_note0"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 60, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  sleep 0.25
end

live_loop :pi_note1 do
  use_real_time
  use_synth :prophet
  msg_in = sync "/osc*/pi_note1"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 70, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  sleep 0.25
end

live_loop :pi_note2 do
  use_real_time
  use_synth :hoover
  msg_in = sync "/osc*/pi_note2"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 80, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  sleep 0.25
end

live_loop :pi_note3 do
  use_real_time
  use_synth :hoover
  msg_in = sync "/osc*/pi_note3"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 90, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  sleep 0.25
end

live_loop :pi_note4 do
  use_real_time
  use_synth :zawa
  msg_in = sync "/osc*/pi_note4"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 100, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  sleep 0.25
end

live_loop :pi_note5 do
  use_real_time
  use_synth :beep
  msg_in = sync "/osc*/pi_note5"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 110, amp: vol, attack: 0.5, sustain: 0.5, decay: 0.5
  sleep 0.25
end