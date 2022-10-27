#!/bin/bash
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

out=$(seq 5 | ./plus)    # 15 が出ればテスト成功

[ "${out}" = 15 ]

echo $?    # 0 が出ればテスト成功
