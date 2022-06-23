#!/usr/bin/env python3

import os
import signal
import sys
import time


def print_temperature():
    while True:
        temp = os.popen("vcgencmd measure_temp").readline()
        temp = temp.replace("\n", "")
        print(temp)
        time.sleep(1)


def sigint_handler(sig, frame):
    print()
    sys.exit(0)


signal.signal(signal.SIGINT, sigint_handler)
print_temperature()
