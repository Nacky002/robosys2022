#!/bin/bash
# SPDX-FileCopyrightText: 2022 NAGAKI Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo -e "NG at LINE $1    TEST IS FAILED"
    res=1
    exit $res
}

res=0

###  plus test  ###

out=$(seq 5 | ./plus)
[ "$?" = 0 ]          || ng ${LINENO}
[ "${out}" = "15" ]   || ng ${LINENO}

out=$(echo 1.30 2 3.40 4.80 5 | tr ' ' '\n' | ./plus)
[ "$?" = 0 ]          || ng ${LINENO}
[ "${out}" = "16.5" ] || ng ${LINENO}

out=$(echo 推し | ./plus 2> /dev/null)
[ "$?" = 1 ]          || ng ${LINENO}
[ "${out}" = "" ]     || ng ${LINENO}

out=$(echo | ./plus 2> /dev/null)
[ "$?" = 1 ]          || ng ${LINENO}
[ "${out}" = "" ]     || ng ${LINENO}

###  avg test  ###

out=$(seq 5 | ./avg)$
[ "$?" = 0 ]         || ng ${LINENO}
[ "${out}" = "3.0" ] || ng ${LINENO}

out=$(echo 1.30 2 3.40 4.80 5 | tr ' ' '\n' | ./avg)
[ "$?" = 0 ]         || ng ${LINENO}
[ "${out}" = "3.3" ] || ng ${LINENO}

out=$(echo 推し | ./avg 2> /dev/null)
[ "$?" = 1 ]         || ng ${LINENO}
[ "${out}" = "" ]    || ng ${LINENO}

out=$(echo | ./avg 2> /dev/null)
[ "$?" = 1 ]         || ng ${LINENO}
[ "${out}" = "" ]    || ng ${LINENO}

###  vari test  ###

out=$(seq 5 | ./vari)
[ "$?" = 0 ]           || ng ${LINENO}
[ "${out}" = "2.0" ]   || ng ${LINENO}

out=$(echo 1.30 2 3.40 4.80 5 | tr ' ' '\n' | ./vari)
[ "$?" = 0 ]           || ng ${LINENO}
[ "${out}" = "2.168" ] || ng ${LINENO}

out=$(echo 推し | ./vari 2> /dev/null)
[ "$?" = 1 ]           || ng ${LINENO}
[ "${out}" = "" ]      || ng ${LINENO}

out=$(echo | ./vari 2> /dev/null)
[ "$?" = 1 ]           || ng ${LINENO}
[ "${out}" = "" ]      || ng ${LINENO}

###  stan test  ###

out=$(seq 5 | ./stan)
[ "$?" = 0 ]                        || ng ${LINENO}
[ "${out}" = "1.4142135623730951" ] || ng ${LINENO}

out=$(echo 1.30 2 3.40 4.80 5 | tr ' ' '\n' | ./stan)
[ "$?" = 0 ]                        || ng ${LINENO}
[ "${out}" = "1.472412985544477" ]  || ng ${LINENO}

out=$(echo 推し | ./stan 2> /dev/null)
[ "$?" = 1 ]                        || ng ${LINENO}
[ "${out}" = "" ]                   || ng ${LINENO}

out=$(echo | ./stan 2> /dev/null)
[ "$?" = 1 ]                        || ng ${LINENO}
[ "${out}" = "" ]                   || ng ${LINENO}

[ "$res" = 0 ] && echo -e "TEST IS SUCCESS !!"

exit $res    # このシェルスクリプトの終了ステータスを返して終了
