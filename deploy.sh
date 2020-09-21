#!/bin/bash

rm *.pyc
scp -r * rg350:/media/data/local/share/xmame/xmame_sm_bridge
ssh rg350 "rm -rf /media/data/local/share/xmame/xmame_sm_bridge/xmame_sm_bridge"
