################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../GeographicLib/src/Accumulator.cc \
../GeographicLib/src/AlbersEqualArea.cc \
../GeographicLib/src/AzimuthalEquidistant.cc \
../GeographicLib/src/CassiniSoldner.cc \
../GeographicLib/src/CircularEngine.cc \
../GeographicLib/src/DMS.cc \
../GeographicLib/src/Ellipsoid.cc \
../GeographicLib/src/EllipticFunction.cc \
../GeographicLib/src/GARS.cc \
../GeographicLib/src/GeoCoords.cc \
../GeographicLib/src/Geocentric.cc \
../GeographicLib/src/Geodesic.cc \
../GeographicLib/src/GeodesicExact.cc \
../GeographicLib/src/GeodesicExactC4.cc \
../GeographicLib/src/GeodesicLine.cc \
../GeographicLib/src/GeodesicLineExact.cc \
../GeographicLib/src/Geohash.cc \
../GeographicLib/src/Geoid.cc \
../GeographicLib/src/Georef.cc \
../GeographicLib/src/Gnomonic.cc \
../GeographicLib/src/GravityCircle.cc \
../GeographicLib/src/GravityModel.cc \
../GeographicLib/src/LambertConformalConic.cc \
../GeographicLib/src/LocalCartesian.cc \
../GeographicLib/src/MGRS.cc \
../GeographicLib/src/MagneticCircle.cc \
../GeographicLib/src/MagneticModel.cc \
../GeographicLib/src/Math.cc \
../GeographicLib/src/NormalGravity.cc \
../GeographicLib/src/OSGB.cc \
../GeographicLib/src/PolarStereographic.cc \
../GeographicLib/src/PolygonArea.cc \
../GeographicLib/src/Rhumb.cc \
../GeographicLib/src/SphericalEngine.cc \
../GeographicLib/src/TransverseMercator.cc \
../GeographicLib/src/TransverseMercatorExact.cc \
../GeographicLib/src/UTMUPS.cc \
../GeographicLib/src/Utility.cc 

CC_DEPS += \
./GeographicLib/src/Accumulator.d \
./GeographicLib/src/AlbersEqualArea.d \
./GeographicLib/src/AzimuthalEquidistant.d \
./GeographicLib/src/CassiniSoldner.d \
./GeographicLib/src/CircularEngine.d \
./GeographicLib/src/DMS.d \
./GeographicLib/src/Ellipsoid.d \
./GeographicLib/src/EllipticFunction.d \
./GeographicLib/src/GARS.d \
./GeographicLib/src/GeoCoords.d \
./GeographicLib/src/Geocentric.d \
./GeographicLib/src/Geodesic.d \
./GeographicLib/src/GeodesicExact.d \
./GeographicLib/src/GeodesicExactC4.d \
./GeographicLib/src/GeodesicLine.d \
./GeographicLib/src/GeodesicLineExact.d \
./GeographicLib/src/Geohash.d \
./GeographicLib/src/Geoid.d \
./GeographicLib/src/Georef.d \
./GeographicLib/src/Gnomonic.d \
./GeographicLib/src/GravityCircle.d \
./GeographicLib/src/GravityModel.d \
./GeographicLib/src/LambertConformalConic.d \
./GeographicLib/src/LocalCartesian.d \
./GeographicLib/src/MGRS.d \
./GeographicLib/src/MagneticCircle.d \
./GeographicLib/src/MagneticModel.d \
./GeographicLib/src/Math.d \
./GeographicLib/src/NormalGravity.d \
./GeographicLib/src/OSGB.d \
./GeographicLib/src/PolarStereographic.d \
./GeographicLib/src/PolygonArea.d \
./GeographicLib/src/Rhumb.d \
./GeographicLib/src/SphericalEngine.d \
./GeographicLib/src/TransverseMercator.d \
./GeographicLib/src/TransverseMercatorExact.d \
./GeographicLib/src/UTMUPS.d \
./GeographicLib/src/Utility.d 

OBJS += \
./GeographicLib/src/Accumulator.o \
./GeographicLib/src/AlbersEqualArea.o \
./GeographicLib/src/AzimuthalEquidistant.o \
./GeographicLib/src/CassiniSoldner.o \
./GeographicLib/src/CircularEngine.o \
./GeographicLib/src/DMS.o \
./GeographicLib/src/Ellipsoid.o \
./GeographicLib/src/EllipticFunction.o \
./GeographicLib/src/GARS.o \
./GeographicLib/src/GeoCoords.o \
./GeographicLib/src/Geocentric.o \
./GeographicLib/src/Geodesic.o \
./GeographicLib/src/GeodesicExact.o \
./GeographicLib/src/GeodesicExactC4.o \
./GeographicLib/src/GeodesicLine.o \
./GeographicLib/src/GeodesicLineExact.o \
./GeographicLib/src/Geohash.o \
./GeographicLib/src/Geoid.o \
./GeographicLib/src/Georef.o \
./GeographicLib/src/Gnomonic.o \
./GeographicLib/src/GravityCircle.o \
./GeographicLib/src/GravityModel.o \
./GeographicLib/src/LambertConformalConic.o \
./GeographicLib/src/LocalCartesian.o \
./GeographicLib/src/MGRS.o \
./GeographicLib/src/MagneticCircle.o \
./GeographicLib/src/MagneticModel.o \
./GeographicLib/src/Math.o \
./GeographicLib/src/NormalGravity.o \
./GeographicLib/src/OSGB.o \
./GeographicLib/src/PolarStereographic.o \
./GeographicLib/src/PolygonArea.o \
./GeographicLib/src/Rhumb.o \
./GeographicLib/src/SphericalEngine.o \
./GeographicLib/src/TransverseMercator.o \
./GeographicLib/src/TransverseMercatorExact.o \
./GeographicLib/src/UTMUPS.o \
./GeographicLib/src/Utility.o 


# Each subdirectory must supply rules for building sources it contributes
GeographicLib/src/%.o: ../GeographicLib/src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/home/liborio/VehicularNetworking/workspace/localcoordinates/GeographicLib/include" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


