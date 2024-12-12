#!/usr/bin/env python3
import serial
from pythonosc import osc_message_builder
from pythonosc import udp_client
# from gpiozero import DistanceSensor
import time


triggerDebounce = [0, 0, 0, 0, 0, 0]
triggerDebounceVal = 5
distDebounceCounter = 0
distDebounceVal = 150
piezoVals = [0, 0, 0, 0, 0, 0]
piezoMin = 0
piezoMax = 600
oscOutMin = 0
oscOutMax = 100

# convert value from left range to right range
def translate(value, leftMin, leftMax, rightMin, rightMax):
    # If value outside of range, apply ceiling
    if (value > leftMax): 
        value = leftMax
    if (value < leftMin):
        value = leftMin

    # Figure out how 'wide' each range is
    leftSpan = leftMax - leftMin
    rightSpan = rightMax - rightMin

    # Convert the left range into a 0-1 range (float)
    valueScaled = float(value - leftMin) / float(leftSpan)

    # Convert the 0-1 range into a value in the right range.
    return rightMin + (valueScaled * rightSpan)

def processTrigger(piezoVals):
    base_thresh = 70
    threshes = [base_thresh] * len(piezoVals)
    for idx in range(len(piezoVals)):
        piezoVal = piezoVals[idx]
        thresh = threshes[idx]
        if piezoVal > thresh:
            if triggerDebounce[idx] == 0: 
                piezoVal = translate(piezoVal, piezoMin, piezoMax, oscOutMin, oscOutMax)
                osc_message_name = f'pi_note{idx}'
                print(f'{osc_message_name}: {piezoVal}')
                osc_sender.send_message(osc_message_name, piezoVal)    
                triggerDebounce[idx] = triggerDebounceVal
            else: triggerDebounce[idx] += -1

def processDist(dist, osc_sender):
    thresh = 40
    global distDebounceCounter
    if dist <= thresh:
        if distDebounceCounter == 0:
            osc_message_name = 'change_root'
            osc_sender.send_message(osc_message_name, 1)
            distDebounceCounter = distDebounceVal
            print(f'changing root')
        else : distDebounceCounter = distDebounceCounter - 1



if __name__ == '__main__':
    localhost_ip = '127.0.0.1'
    #macbook_ip = '192.168.2.1'
    macbook_ip = '169.254.64.122'
    osc_sender = udp_client.SimpleUDPClient(macbook_ip, 4560)
    #osc_sender = udp_client.SimpleUDPClient(localhost_ip, 4560)
    ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
    ser.reset_input_buffer()

    # dist_sensor = DistanceSensor(echo=27, trigger=22, max_distance=4)
    time.sleep(1)

    while True:
        # dist = dist_sensor.distance * 100
        #print(f'dist: {dist}')
        # processDist(dist, osc_sender)
        if ser.in_waiting > 0:
            #line = ser.readline().decode('utf-8').rstrip()
            try:
                line = ser.readline()
                vals = line.split()
                for idx in range(len(vals)):
                    piezoVals[idx] = int(vals[idx])
                processTrigger(piezoVals)
                #print(f'{piezoVals}')
            except ValueError:
                continue
            except IndexError:
                continue
        
