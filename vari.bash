#!/bin/bash
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo -e "\nNG at LINE $1    TEST IS FAILED"
    res=1
    exit $res
}

res=0

##### I/O #####

out=$(seq 5 | ./vari)
[ "$?" = 0 ]           || ng ${LINENO}
[ "${out}" = "2.0" ]   || ng ${LINENO}

out=$(echo 1.30 2 3.40 4.80 5 | tr ' ' '\n' | ./vari)
[ "$?" = 0 ]           || ng ${LINENO}
[ "${out}" = "2.168" ] || ng ${LINENO}

##### STRANGE INPUT #####

out=$(echo 推し | ./vari)
[ "$?" = 1 ]           || ng ${LINENO}
[ "${out}" = "" ]      || ng ${LINENO}

out=$(echo | ./vari)
[ "$?" = 1 ]           || ng ${LINENO}
[ "${out}" = "" ]      || ng ${LINENO}

[ "$res" = 0 ] && echo -e "\nTEST IS SUCCESS !!"

exit $res       # このシェルスクリプトの終了ステータスを返して終了
