#!/bin/bash

# we need to manually set all PYSIDE_* paths as autodetection is broken:
    # https://github.com/FreeCAD/FreeCAD/pull/2020
PYVER="$(/usr/bin/python3 -c 'import sys; print("{}.{}".format(sys.version_info.major,sys.version_info.minor))')"

cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/lib/freecad" \
        -DCMAKE_INSTALL_DATAROOTDIR="/usr/share" \
        -DCMAKE_INSTALL_DOCDIR="/usr/share/freecad/doc" \
        -DFREECAD_USE_OCC_VARIANT="Official Version" \
        -DBUILD_QT5=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DOPENMPI_INCLUDE_DIRS=/usr/include \
        -DPYSIDE_INCLUDE_DIR="/usr/include/PySide2" \
        -DPYSIDE_LIBRARY="/usr/lib/libpyside2.cpython-${PYVER//.}m-${CARCH}-linux-gnu.so" \
        -DPYSIDE_PYTHONPATH="/usr/lib/python${PYVER}/site-packages/PySide2" \
        -DPYSIDE_TYPESYSTEMS="/usr/share/PySide2/typesystems" \
        .
