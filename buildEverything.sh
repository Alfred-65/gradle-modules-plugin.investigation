#!/bin/sh

# The purpose of this shell-srcipt is to build all the projects in this folder.
#
# In particular the following actions are performed:
# a. gradlew build pushToMavenLocal
# b. gradlew cleanEclipse eclipse

# Note: Multiline comments could start with : ' and end with # '

# The following sub-routine performs all the work, i.e.
# - build and publish projects
# - generates eclipse files.
# The sub-routine has to be called with one parameter:
# $1 name of sub-folder
buildAndPublish () {
  if [ "$#" -ne 1 ]; then
    # ... not one arguments
    echo "USAGE: buildAndPublish nameOfSubFolder"
    echo "e.g.:  download project-ma601"
    return -1
  fi # end if
  # ... exact one arguments

  subFolder="$1"
  echo "-------------------------------------------------------" && \
  echo "building $1" && \
  cd $1 && \
  ./gradlew build publishToMavenLocal && \
  echo "-------------------------------------------------------" && \
  echo "create Eclipse files" && \
  ./gradlew cleanEclipse eclipse && \
  ./gradlew --stop

  returnValue=$?
  if [ $returnValue -ne 0 ]; then
    echo "Return code was not zero but ${returnValue}."
    return -2
  else
    cd ..
  fi
  return 0
} # end buildAndPublish

buildAndPublish "project-ma601" && \
buildAndPublish "project-mu610" && \
buildAndPublish "project-tu531" && \
buildAndPublish "project-tu564" && \
buildAndPublish "project-tu630" && \
buildAndPublish "project-zu601" && \
buildAndPublish "project-zu630" && \
echo afiDone
