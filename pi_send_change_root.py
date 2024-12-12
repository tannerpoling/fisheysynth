#!/usr/bin/env python3
import time
from pythonosc import osc_message_builder
from pythonosc import udp_client
from gpiozero import DistanceSensor

def processDist(dist, osc_sender):
    thresh = 40
    if dist <= thresh:
        osc_message_name = 'change_root'
        osc_sender.send_message(osc_message_name, 1)
        distDebounceCounter = distDebounceVal
        print(f'changing root')
        time.sleep(3)

if __name__ == '__main__':
	localhost_ip = '127.0.0.1'
    #macbook_ip = '192.168.2.1'
    macbook_ip = '169.254.64.122'
    osc_sender = udp_client.SimpleUDPClient(macbook_ip, 4560)
    dist_sensor = DistanceSensor(echo=27, trigger=22, max_distance=4)
	while True:
		dist = dist_sensor.distance * 100
		processDist(dist, osc_sender)