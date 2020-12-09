
# NSO_VERSION
#  export NSO_VERSION ?= 5.3
#
# CI_PROJECT_NAME
#  ifneq ($(CI_PROJECT_NAME),)
#  PROJECT_NAME=$(CI_PROJECT_NAME)
#  else
#  PROJECT_NAME:=$(shell basename $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST)))))
#  endif

# PNS
#  ifneq ($(CI_PIPELINE_ID),)
#  PNS:=$(CI_PIPELINE_ID)
#  else
#  ifneq ($(NSO_VERSION),)
#  PNS:=$(shell whoami | sed 's/[^[:alnum:]._-]\+/_/g')
#  endif
#  endif

#CNT_PREFIX?=testenv-$(PROJECT_NAME)-$(NSO_VERSION)-$(PNS)
CNT_PREFIX?=testenv-nso-arroyo-5.3-jharr

ROBOT_CT=jamesharr/nso-robot:latest

#--label com.cisco.nso.testenv.name=$(CNT_PREFIX)
#--network $(CNT_PREFIX)

.PHONY: build
build:
	docker build -t $(ROBOT_CT) -f Dockerfile .

.PHONY: run
run:
	test -d robot-logs || mkdir robot-logs
	docker run -t --rm \
		--network $(CNT_PREFIX) \
		--volume $(PWD)/robot:/robot \
		--volume $(PWD)/robot-logs:/robot-logs \
		$(ROBOT_CT) \
		robot -d /robot-logs /robot

.PHONY: push
push:
	docker push $(ROBOT_CT)

.PHONY: clean
clean:
