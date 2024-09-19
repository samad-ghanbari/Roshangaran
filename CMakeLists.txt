cmake_minimum_required(VERSION 3.16)

project(Roshangaran VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appRoshangaran
    main.cpp
)

qt_add_qml_module(appRoshangaran
    URI Roshangaran
    VERSION 1.0
    QML_FILES UI/Main.qml
    QML_FILES UI/login/Login.qml
    QML_FILES UI/home/Home.qml
)

qt_add_resources(appRoshangaran "assets"
    PREFIX "/"
    FILES
        Assets/font/yekan.ttf

        Assets/icon/logo64.ico
        Assets/icon/logo128.ico

        Assets/Images/background/back1.jpg
        Assets/Images/background/back2.jpg
        Assets/Images/background/back3.jpg
        Assets/Images/background/back4.jpg

        Assets/Images/logo/logo64.png
        Assets/Images/logo/logo128.png
        Assets/Images/logo/logo512.png
        Assets/Images/logo/logo1024.png

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appRoshangaran PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appRoshangaran
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRoshangaran
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appRoshangaran
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
