#!/bin/bash

# we need to manually set all PYSIDE_* paths as autodetection is broken:
    # https://github.com/FreeCAD/FreeCAD/pull/2020
PYVER="$(/usr/bin/python3 -c 'import sys; print("{}.{}".format(sys.version_info.major,sys.version_info.minor))')"

cmake \
        -DCMAKE_INSTALL_PREFIX="build-install" \
        -DCMAKE_INSTALL_DATAROOTDIR="dataroot" \
        -DCMAKE_INSTALL_DOCDIR="dataroot/doc" \
        -DBUILD_QT5=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        .
