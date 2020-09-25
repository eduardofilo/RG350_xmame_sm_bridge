#!/bin/bash

ssh rg350 "mkdir /media/data/local/share/xmame/sm_bridge"
scp *.py rg350:/media/data/local/share/xmame/sm_bridge
scp romset.* rg350:/media/data/local/share/xmame/sm_bridge
scp v rg350:/media/data/local/share/xmame/sm_bridge
scp -r resources rg350:/media/data/local/share/xmame/sm_bridge
