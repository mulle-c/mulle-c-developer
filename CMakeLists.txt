cmake_minimum_required( VERSION 3.14)

project( mulle-c-developer NONE)

set( PROJECT_VERSION 0.17.1)

set( EXTENSIONS
src/  # backslash is important
)


install( DIRECTORY ${EXTENSIONS}
   DESTINATION "share/mulle-sde/extensions"
   USE_SOURCE_PERMISSIONS
   PATTERN "*._DS_Store" EXCLUDE
   PATTERN "*.ignore" EXCLUDE
)


######
#
# must be after CPACK_PACKAGE_VERSION
include( CMakePackage.cmake)
include( CPack)
