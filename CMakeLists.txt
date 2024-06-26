cmake_minimum_required(VERSION 3.16)

project(TupletDrums VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(OpenAL)

qt_standard_project_setup()

qt_add_executable(appTupletDrums
    main.cpp
)

qt_add_qml_module(appTupletDrums
    URI TupletDrums
    VERSION 1.0
    QML_FILES Main.qml QuintupletsHatModel.qml QuintupletsKickModel.qml QuintupletsSnareModel.qml QuintupletsClapModel.qml
              SeptupletsHatModel.qml SeptupletsKickModel.qml SeptupletsSnareModel.qml SeptupletsClapModel.qml PlayButton.qml
              TempoInput.qml TupletTypeSwitch.qml TextButton.qml
    RESOURCES Images.qrc Fonts.qrc
    RESOURCES Sounds.qrc
    SOURCES drummachine.h drummachine.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTupletDrums PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTupletDrums
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTupletDrums
    PRIVATE Qt6::Quick OpenAL::OpenAL
)

include(GNUInstallDirs)
install(TARGETS appTupletDrums
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
