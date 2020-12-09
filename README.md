Usage:
* Create a directory named `robot` and put all your robot stuff in there
* Create a directory named `robot-logs` for the output
* Run
```sh
PROJECT=nso-arroyo
NSO_VERSION=5.3
USER=jharr
ROBOT_CT=jamesharr/nso-robot:latest

NETWORK=testenv-${PROJECT}-${NSO_VERSION}-${USER}

docker run -t --rm \
        --network ${NETWORK} \
        --volume ${PWD}/robot:/robot \
        --volume ${PWD}/robot-logs:/robot-logs \
        jamesharr/nso-robot:latest \
        robot --outputdir /robot-logs /robot
```
