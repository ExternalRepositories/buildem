#
# Install matplotlib library from source
#

if (NOT matplotlib_NAME)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

include (python)
include (numpy)
include (libpng)
include (freetype2)

external_source (matplotlib
    1.1.1
    matplotlib-1.1.1.tar.gz
    80eb9862fa09c7e06eda6e2a9fc4042f
    http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.1.1)

message ("Installing ${matplotlib_NAME} into FlyEM build area: ${FLYEM_BUILD_DIR} ...")
ExternalProject_Add(${matplotlib_NAME}
    DEPENDS             ${python_NAME} ${numpy_NAME} ${libpng_NAME} ${freetype2_NAME}
    PREFIX              ${FLYEM_BUILD_DIR}
    URL                 ${matplotlib_URL}
    URL_MD5             ${matplotlib_MD5}
    UPDATE_COMMAND      ""
    PATCH_COMMAND       ""
    CONFIGURE_COMMAND   ""
    BUILD_COMMAND       ${FLYEM_ENV_STRING} ${PYTHON_EXE} setup.py build
    BUILD_IN_SOURCE     1
    TEST_COMMAND        ""
    INSTALL_COMMAND     ${FLYEM_ENV_STRING} ${PYTHON_EXE} setup.py install
)

endif (NOT matplotlib_NAME)