#!/bin/bash
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo TEST IS FAILED
    echo NG at LINE $1
    res=1
}

res=0

out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng ${LINENO}      # out に 15 が入っていれば成功。
[ "$res" = 0 ] && echo TEST IS SUCCESS !!

echo $?    # 0 が出ればテスト成功
exit $res