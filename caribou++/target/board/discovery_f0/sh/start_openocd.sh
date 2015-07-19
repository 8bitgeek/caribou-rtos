#!/bin/bash
openocd --search /usr/local/share/openocd/scripts --search ./ --search driver_stm32f051/sh -f driver_stm32f051/sh/stm32f051.cfg
