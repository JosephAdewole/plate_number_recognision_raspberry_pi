# plate_number_recognision_raspberry_pi
This software tracks cars in a parking lot. This makes detection of defaulters (illegal parking) easy.  

# how?
This software runs on a raspberry pi, it detects a car plates number using a pi camera and sends it to a backend server. This is part of a larger system.

# details
It all starts in the main.py

upon a reception of a signal (to take a picture), the pi sends another signal to indicate it's busy (stopping the robot) then takes a picture of a car showing the plate number, this picture is uploaded to Azure Cognitive Vision API to extract the plate number, the extracted plate number (if any) is sent to a backend server with the packing spot/space id and current time. At the end of this event, the pi sends another signal to tell the rest of the system it's no longer busy (to move the robot to the next car).

Below is a pseudo code of what happens
```
  check for signal (to take pictures) periodically, if none, wait
  if signal is detected then send another to stop the robot, take a picture 
  send picture to Azure Cognitive Vision to extract plate number
  Send plate number, packing lot id and current time to back end server
  repeat the whole process
```

# file structure
  
  config.py  
  robot_interface.py  
  plate_recognition.py  
  take_picture.py  
  main.py*
  
## config.py  
Contains key value pairs (dictionary) like the subscription key to access Azure congitive vision endpoint and a few endpoints that can change.  
It also has the number of expected parking lot

```

CONFIG = {"COMPUTER_VISION_SUBSCRIPTION_KEY":"5c0c98esjflkfk548c9951f5",
"COMPUTER_VISION_ENDPOINT":"https://plate-ocr-mawaqif.cognitiveservices.azure.com/vision/v3.2/ocr?language=unk&detectOrientation=true&model-version=latest",
"MAWAQIF_UPLOAD_CHECKS":"https://mawaqif.herokuapp.com/api/checks/add","NUMBER_OF_PACKING_SPACES":5}
```


