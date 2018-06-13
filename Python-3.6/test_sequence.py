import openhand as OH
import time

T=OH.Model_O('/dev/ttyUSB1')
time.sleep(3)
T.adduct()
time.sleep(0.5)
T.moveMotor(1,0.3)
time.sleep(1)
T.moveMotor(3,0.5)
time.sleep(5)
T.pinch_close()
