#!/usr/bin/env python3
from pythonosc import osc_message_builder
from pythonosc import udp_client
from time import sleep
import random

if __name__ == '__main__':
    osc_sender = udp_client.SimpleUDPClient('192.168.2.1', 4560)
    while True:
        trigger_val = random.randint(50, 100)
        idx = 0
        osc_message_name = f'pi_note{idx}'
        osc_sender.send_message(osc_message_name, trigger_val)
        sleep(0.5)