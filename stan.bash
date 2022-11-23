#!/bin/bash
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo -e "NG at LINE $1    TEST IS FAILED"
    res=1
    exit $res
}

res=0

##### I/O #####

out=$(seq 5 | ./stan)
[ "$?" = 0 ]                        || ng ${LINENO}
[ "${out}" = "1.4142135623730951" ] || ng ${LINENO}

out=$(echo 1.30 2 3.40 4.80 5 | tr ' ' '\n' | ./stan)
[ "$?" = 0 ]                        || ng ${LINENO}
[ "${out}" = "1.472412985544477" ]  || ng ${LINENO}

##### STRANGE INPUT #####

out=$(echo 推し | ./stan 2> /dev/null)
[ "$?" = 1 ]                        || ng ${LINENO}
[ "${out}" = "" ]                   || ng ${LINENO}

out=$(echo | ./stan 2> /dev/null)
[ "$?" = 1 ]                        || ng ${LINENO}
[ "${out}" = "" ]                   || ng ${LINENO}

[ "$res" = 0 ] && echo -e "TEST IS SUCCESS !!"

exit $res       # このシェルスクリプトの終了ステータスを返して終了
