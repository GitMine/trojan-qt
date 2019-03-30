SET(CMAKE_AUTORCC ON)
SET(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

SET(TROJAN_QT_HEADER
  trojan/src/authenticator.h
  trojan/src/clientsession.h
  trojan/src/config.h
  trojan/src/forwardsession.h
  trojan/src/udpforwardsession.h
  trojan/src/log.h
  trojan/src/serversession.h
  trojan/src/service.h
  trojan/src/session.h
  trojan/src/ssldefaults.h
  trojan/src/sslsession.h
  trojan/src/trojanrequest.h
  trojan/src/version.h
  App.h
  Window.h
  Button.h
  Version.h
  IconButton.h
  BodyWidget.h
  StackedWidget.h
  ServiceThread.h
  ConfigEditor.h
  AppManager.h
)

set(TROJAN_QT_SRC
  trojan/src/authenticator.cpp
  trojan/src/clientsession.cpp
  trojan/src/config.cpp
  trojan/src/forwardsession.cpp
  trojan/src/udpforwardsession.cpp
  trojan/src/log.cpp
  trojan/src/serversession.cpp
  trojan/src/service.cpp
  trojan/src/session.cpp
  trojan/src/socks5address.cpp
  trojan/src/ssldefaults.cpp
  trojan/src/sslsession.cpp
  trojan/src/trojanrequest.cpp
  trojan/src/udppacket.cpp
  trojan/src/version.cpp
  App.cpp
  main.cpp
  Window.cpp
  Button.cpp
  IconButton.cpp
  BodyWidget.cpp
  StackedWidget.cpp
  ServiceThread.cpp
  ConfigEditor.cpp
  AppManager.cpp
)

set(TROJAN_QT_RES
  img.qrc
  file.qrc
)


add_executable(trojan-qt
  ${TROJAN_QT_HEADER}
  ${TROJAN_QT_SRC}
  ${TROJAN_QT_RES}
)

target_link_libraries(trojan-qt PRIVATE
  ${CMAKE_THREAD_LIBS_INIT}
  ${Boost_LIBRARIES}
  ${OPENSSL_LIBRARIES}
  Qt5::Widgets
)

target_include_directories(trojan-qt PRIVATE
  ${Boost_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
)

if (APPLE)
    find_framework(Security trojan-qt)
    set(MACOSX_ICON "${CMAKE_CURRENT_SOURCE_DIR}/trojan-qt.icns")
    set_source_files_properties(${MACOSX_ICON} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
    target_sources(trojan-qt PRIVATE ${MACOSX_ICON})
    set_target_properties(trojan-qt PROPERTIES MACOSX_BUNDLE TRUE)
    set_target_properties(trojan-qt PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist)
elseif(WIN32)
    # compile as a win32 gui application instead of a console application
    target_link_libraries(trojan-qt PRIVATE Qt5::WinMain wsock32 ws2_32 crypt32)
    if(MSVC)
        set_target_properties(trojan-qt PROPERTIES LINK_FLAGS_RELEASE "/SUBSYSTEM:WINDOWS")
    elseif(MINGW)
        set_target_properties(trojan-qt PROPERTIES LINK_FLAGS_RELEASE "-mwindows")
    endif()
endif()

if(MSVC)
  include(CopyQt5Deps)
  copy_Qt5_deps(trojan-qt)
endif()
