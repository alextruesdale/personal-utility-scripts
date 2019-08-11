#!/usr/bin/env python3

import time
import threading
from pynput.mouse import Button, Controller
from pynput.keyboard import Listener

class ClickMouse(threading.Thread):

    def __init__(self):

        super().__init__()
        self.delay = 45
        self.button = Button.left
        self.running = False
        self.programme_running = True
        self.direction = 'right'
        self.first_pass = True

        print('Press enter to prompt programme controller.')

    def start_clicking(self):
        self.running = True

    def stop_clicking(self):
        self.running = False

    def exit(self):
        self.stop_clicking()
        self.programme_running = False

    def run(self):
        while self.programme_running:
            while self.running:
                mouse.click(self.button)
                time.sleep(self.delay)
                if self.direction == 'right':
                    mouse.move(-25, 0)
                    self.direction = 'left'
                elif self.direction == 'left':
                    mouse.move(25, 0)
                    self.direction = 'right'

mouse = Controller()
click_thread = ClickMouse()
click_thread.start()

def on_press(key):
    if hasattr(key, 'name'):
        if key.name == 'enter':
            if click_thread.first_pass == True:
                print("Type 'start' / 'stop' to control the clicking bot – 'exit' to close programme")
                click_thread.first_pass = False

            user_input = input('\r enter command... ')
            if user_input == 'stop':
                if click_thread.running:
                    click_thread.stop_clicking()

            elif user_input == 'start':
                click_thread.start_clicking()

            elif user_input == 'exit':
                click_thread.exit()
                listener.stop()

with Listener(on_press=on_press) as listener:
    listener.join()
