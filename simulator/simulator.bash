#!/bin/bash
#
#  Copyright (c) 2018 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
#
#   author  : Jeong Han Lee
#   email   : jeonghan.lee@gmail.com
#   date    : Thursday, July 19 16:56:13 CEST 2018
#   version : 0.0.1

declare -gr SC_SCRIPT="$(realpath "$0")"
declare -gr SC_SCRIPTNAME=${0##*/}
declare -gr SC_TOP="${SC_SCRIPT%/*}"


KAM_TOP=${SC_TOP}/kameleon

# We have to go the toplevel of the working tree.
pushd ${SC_TOP}/../
git submodule update --init --recursive ;
git submodule update --remote ;
popd 

python ${KAM_TOP}/kameleon.py --host="127.0.0.1" --file=${SC_TOP}/atomki_scb_monitor.kam
