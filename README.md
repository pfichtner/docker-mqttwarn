## mqttwarn docker image
Subscribe to MQTT topics (with wildcards) and notifiy pluggable services.  
*Project from https://github.com/jpmens/mqttwarn.*

The image is build on every change in this repository and even the mqttwarn repository. So the resulting image reflects a bleeding edge version of mqttmain. 

### Configuration file
Before running the container, you must create mqttwarn.ini configuration file.  
See https://github.com/jpmens/mqttwarn for details how to do that. 

### Run the container
Run mqttwarn with link to mosquitto container (if mqttwarn.ini resists in current directory):  
`docker run -d --name mqttwarn -v $PWD:/opt/mqttwarn/conf --link mosquitto:mosquitto pfichtner/mqttwarn`
