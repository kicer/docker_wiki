#!/usr/bin/env bash

cd `dirname ${0}`
. docker-func.sh

test -z "${GIT}" && exitBy "没有变量\${GIT}"
test -z "${TAG}" && exitBy "没有变量\${TAG}"

# 默认的启动脚本/以及工作目录
export ENTRYPOINT=${ENTRYPOINT:-"start.sh"}
export WORKDIR=${WORKDIR:-"/app/server"}

info "拉取代码"
export SERVER_DIR=/repo/${GIT}
git_clone ${SERVER_DIR} "${GIT}" "${TAG}"

info "更新工作目录"
cd / && rm -fr ${WORKDIR} && mkdir -p ${WORKDIR} && cd ${SERVER_DIR} && tar c . --exclude=.git | tar x -C ${WORKDIR}

info "准备启动"
cd ${WORKDIR}
if [ "${ENTRYPOINT:0:1}" != "/" ]
then
  ENTRYPOINT=${WORKDIR}/${ENTRYPOINT}
fi
test -x "${ENTRYPOINT}" || exitBy "entrypoint[${WORKDIR}][${ENTRYPOINT}]失效"

info "执行启动脚本[${WORKDIR}][${ENTRYPOINT}]"
${ENTRYPOINT} || exitBy "启动脚本[${WORKDIR}][${ENTRYPOINT}]执行失败"

info "SUCC [${WORKDIR}][${ENTRYPOINT}]"
info "wait for shutdown"
tail -f /dev/stdout
