#!/usr/bin/python3
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

import sys
import math

suma = 0
sumv = 0
item = 0
inps = []

for line in sys.stdin:
    inps.append(line)
    suma += float(line)
    item += 1

avg = suma / item        # 平均

for line in inps:
    diff = ( float(line) - avg )**2
    sumv += diff

vari = sumv / item       # 分散

stan = math.sqrt(vari)   # 標準偏差

print(stan)
