cmake_minimum_required(VERSION 2.8)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)


rosbuild_init()

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#include_directories(${PROJECT_SOURCE_DIR}/include/${PROJECT_NAME})

#uncomment if you have defined messages
rosbuild_genmsg()
#uncomment if you have defined services
rosbuild_gensrv()




set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}  CACHE PATH "CMAKE_MODULE_PATH")
#MESSAGE(STATUS "CMAKE_PATH: " ${CMAKE_MODULE_PATH})
#MESSAGE(STATUS "CMAKE_DIR: " ${CMAKE_SOURCE_DIR})
find_package(libdxl REQUIRED)
find_package ( SDL REQUIRED )

find_package(urg_c REQUIRED)

include_directories(/usr/include/urg)
link_directories(/usr/lib)



find_package(PCL REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
link_libraries(${PCL_LIBRARIES})

rosbuild_add_executable(bin_nodo_hokuyo src/nodo_hokuyo.cpp)
rosbuild_add_executable(bin_nodo_dynamixel src/nodo_dynamixel.cpp src/motordynamixel.cpp)
rosbuild_add_executable(bin_nodo_laser3D src/nodo_laser3D.cpp)
rosbuild_add_executable(bin_cliente src/cliente.cpp)
rosbuild_add_executable(bin_client_dynamixel src/client_dynamixel.cpp)
rosbuild_add_executable(bin_cliente_hokuyo src/cliente_hokuyo.cpp)
rosbuild_add_executable(bin_sus_hokuyo src/sus_hokuyo.cpp)

target_link_libraries(bin_nodo_dynamixel 
	${LIBDXL_LIBRARIES}
	#tinyxml
)
target_link_libraries(bin_client_dynamixel 
	${LIBDXL_LIBRARIES}
	#tinyxml
)
target_link_libraries(bin_cliente
	${PCL_LIBRARIES}
	tinyxml
)
target_link_libraries(bin_nodo_laser3D ${PCL_LIBRARIES})
target_link_libraries (bin_nodo_hokuyo

   /usr/lib/liburg.a
   #/usr/lib/libc_urg.a
   /usr/lib/liburg_common.a
   #/usr/lib/libc_urg_connection.a
   /usr/lib/liburg_connection.a
   /usr/lib/liburg_connection_sdl.a
   /usr/lib/liburg_coordinate.a
   #/usr/lib/libc_urg_coordinate.a
   /usr/lib/liburg_geometry.a
   /usr/lib/liburg_monitor.a
   #/usr/lib/libc_urg_system.a
   /usr/lib/liburg_system.a
   ${urg_c_LIBRARIES}
   ${SDL_LIBRARY})
   #${SDLIMAGE_LIBRARY} # if using SDL_image, obviously
 
SET(CMAKE_C_FLAGS  "-I/usr/local/include/urg")









