cmake_minimum_required( VERSION 3.14)

project( mulle-c-developer VERSION 0.18.0 LANGUAGES NONE)

set( PROJECT_VERSION 0.18.0)

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
