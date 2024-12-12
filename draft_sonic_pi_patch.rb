live_loop :pi_note0 do
  use_real_time
  msg_in = sync "/osc*/pi_note0"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 70, amp: vol
  sleep 0.25
end

live_loop :pi_note1 do
  use_real_time
  msg_in = sync "/osc*/pi_note1"
  vol = msg_in[0]
  vol = vol.to_f / 100
  play 50, amp: vol
  sleep 0.25
end