
# developer:    Samad Ghanbari
# Email:        ghanbari.Samad@gmail.com
# Qt Version:   Qt 6.5.2
# Postgresql:   16.4

cmake_minimum_required(VERSION 3.16)

project(Roshangaran VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appRoshangaran
    main.cpp
)


# database support
find_package(Qt6 REQUIRED COMPONENTS Sql)
target_link_libraries(appRoshangaran PRIVATE Qt6::Sql)

# printsupport
find_package(Qt6 REQUIRED COMPONENTS PrintSupport)

qt_add_qml_module(appRoshangaran
    URI Roshangaran
    VERSION 1.0
    QML_FILES UI/login/LoginWindow.qml
    QML_FILES UI/login/LoginForm.qml
    QML_FILES UI/home/HomeWindow.qml
    SOURCES Lib/database/dbman.h Lib/database/dbman.cpp
    SOURCES Backend/Backend.h Backend/Backend.cpp
    QML_FILES UI/login/NewRelease.qml UI/login/NoConnection.qml
    SOURCES Lib/version.h
    # models
    #SOURCES Lib/models/BranchModel.h


    QML_FILES UI/login/OnMaintenance.qml
    QML_FILES UI/login/InitialLogin.qml
    QML_FILES UI/home/ToolbarModule.qml
    QML_FILES UI/home/MenubarModule.qml
    QML_FILES UI/home/HomePage.qml

    QML_FILES UI/user/NewUser.qml
    QML_FILES UI/user/newUserJS.js

    QML_FILES UI/user/ListUser.qml
    QML_FILES UI/public/BaseDialog.qml
    QML_FILES UI/user/ListUser.js
    QML_FILES UI/user/UsersListWidget.qml
    QML_FILES UI/user/User.qml
    QML_FILES UI/user/User.js
    QML_FILES UI/user/UserDelete.qml
    QML_FILES UI/user/UserModify.qml
    QML_FILES UI/user/UserModify.js
    QML_FILES UI/user/ChangePassword.qml
    QML_FILES UI/user/ChangePassDialogBox.qml

    QML_FILES UI/branch/Branches.qml
    QML_FILES UI/branch/BranchInsert.qml
    QML_FILES UI/branch/UpdateBranch.qml
    QML_FILES UI/branch/BranchDelete.qml
    QML_FILES UI/branch/BranchWidget.qml
    QML_FILES UI/branch/Branches.js

    QML_FILES UI/step/Steps.qml
    QML_FILES UI/step/StepInsert.qml
    QML_FILES UI/step/StepUpdate.qml
    QML_FILES UI/step/StepDelete.qml
    QML_FILES UI/step/StepWidget.qml
    QML_FILES UI/step/Step.js

    QML_FILES UI/basis/Basis.qml
    QML_FILES UI/basis/BasisInsert.qml
    QML_FILES UI/basis/BasisUpdate.qml
    QML_FILES UI/basis/BasisDelete.qml
    QML_FILES UI/basis/BasisWidget.qml
    QML_FILES UI/basis/Basis.js

    #QML_FILES UI/studyPeriod/StudyPeriods.qml
    #QML_FILES UI/studyPeriod/StudyPeriodInsert.qml
    #QML_FILES UI/studyPeriod/StudyPeriodUpdate.qml
    #QML_FILES UI/studyPeriod/StudyPeriodDelete.qml
    #QML_FILES UI/studyPeriod/StudyPeriod.js

)

qt_add_resources(appRoshangaran "assets"
    PREFIX "/"
    FILES
        Assets/font/yekan.ttf

        Assets/icon/logo64.ico
        Assets/icon/logo128.ico

        Assets/images/background/back1.jpg
        Assets/images/background/back2.jpg
        Assets/images/background/back3.jpg
        Assets/images/background/back4.jpg

        Assets/images/logo/logo64.png
        Assets/images/logo/logo128.png
        Assets/images/logo/logo512.png
        Assets/images/logo/logo1024.png

        Assets/images/home1.png
        Assets/images/home2.png

        Assets/images/login/disconnection.png
        Assets/images/login/maintenance.png
        Assets/images/login/release.png

        Assets/images/users.png
        Assets/images/user.png
        Assets/images/userLady.png
        Assets/images/female.png
        Assets/images/newUser.png
        Assets/images/branch.png
        Assets/images/school.png
        Assets/images/school2.png
        Assets/images/date.png
        Assets/images/classroom.png
        Assets/images/course.png
        Assets/images/teacher.png
        Assets/images/parents.png
        Assets/images/student.png
        Assets/images/evaluation.png
        Assets/images/toolbox.png

        Assets/images/arrow-up.png
        Assets/images/arrow-down.png
        Assets/images/arrow-right.png
        Assets/images/arrow-left.png

        Assets/images/search.png

        Assets/images/tick.png
        Assets/images/cross.png
        Assets/images/add.png

        Assets/images/setting.png
        Assets/images/setting2.png

        Assets/images/edit.png
        Assets/images/trash.png
        Assets/images/trash2.png
        Assets/images/trash3.png

        Assets/images/key1.png
        Assets/images/key2.png

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
