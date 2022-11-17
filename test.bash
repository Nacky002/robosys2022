#!/bin/bash
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo -e "\nNG at LINE $1"
    res=1
}

res=0

##### I/O #####

out=$(seq 5 | ./plus)
[ "$?" = 0 ]      || ng ${LINENO}
[ "${out}" = 14 ] || ng ${LINENO}           # out=15 で異常なし

out=$(echo 1 2 3 4 5 | tr ' ' '\n' | ./plus)
[ "$?" = 0 ]      || ng ${LINENO}
[ "${out}" = 15 ] || ng ${LINENO}

##### STRANGE INPUT #####

out=$(echo hoge | ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

out=$(echo | ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

out=$(echo 推し | ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

[ "$res" = 0 ] && echo -e "\nTEST IS SUCCESS !!"

exit $res                                   # このシェルスクリプトの終了ステータスを返して終了
