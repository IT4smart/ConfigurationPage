project(ConfigPage)
cmake_minimum_required(VERSION 3.0)
set(CMAKE_AUTOMOC ON)

add_definitions("-std=c++14 -Wall -Wextra -Weffc++ -pedantic")
find_package(Qt5Widgets REQUIRED)

qt5_wrap_ui(UI_HEADERS mainwindow.ui)

add_executable(ConfigPage main.cpp mainwindow.cpp exec_cmd.cpp proxymodel.cpp ${UI_HEADERS})
qt5_use_modules(ConfigPage Widgets)
# The Qt5Widgets_LIBRARIES variable also includes QtGui and QtCore
target_link_libraries(ConfigPage ${Qt5Widgets_LIBRARIES})
