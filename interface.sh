#!/bin/bash

VAR=./test.sh
($VAR) | dialog --title "progress bar" --gauge "Finishing processes" 8 40
