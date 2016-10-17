
/******************SUMO .net file variables
//SUMO represent pairs of Lon Lat Points :(
//<location netOffset="-683301.07,-5914754.73"

//****** Coordenadas Locais
//convBoundary="0.00,0.00,1507.99,7569.75"

//***** Bound Box
//              Lon         Lat         Lon     Lat
//origBoundary="-6.244218,53.349671,-6.222784,53.417644"

//Projection Parameters
//projParameter="+proj=utm +zone=29 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"/>*/

// Example of using the GeographicLib::LocalCartesian class

/* Sample forward calculation
    double lat = 53.417644, lon = -6.222784, h = 0; // Calais
    double x, y, z;
    proj.Forward(lat, lon, h, x, y, z);
    cout << x << " " << y << " " << z << "\n";*/


#include <iostream>
#include <exception>
#include <cmath>

#include <fstream>
#include <string>

#include <GeographicLib/Geocentric.hpp>
#include <GeographicLib/LocalCartesian.hpp>

using namespace std;
using namespace GeographicLib;

//Estrutura para Coordenadas Locais
struct t_Coord{
    double x;
    double y;
};
typedef struct t_Coord Coord;

//Estrutura para Coordenadas Geograficas
struct t_GeoCoord{
    double lat;
    double lon;
};
typedef struct t_GeoCoord GeoCoord;

int main() {
    //TODO Verificar precisão aparentement os numeros estão sendo truncado =/
    string line;
    fstream graphFile("myGraph.txt");
    fstream outGraphFile("outGraph.txt", ios::out);

    //Geographical Coordinates Bound Box
    GeoCoord minGeoCoord, maxGeoCoord;
    //Local Coordinates Bound Box
    Coord minCoord, maxCoord;

    //Reading Gographical and Local BoundBox Coordinates
    graphFile >> minGeoCoord.lon >> minGeoCoord.lat >> maxGeoCoord.lon >> maxGeoCoord.lat;
    graphFile >> minCoord.x >> minCoord.y >> maxCoord.x >> maxCoord.y;

    cout << minGeoCoord.lon << ' ' << minGeoCoord.lat << ' ' << maxGeoCoord.lon << ' ' << maxGeoCoord.lat << endl;
    cout << minCoord.x << ' ' << minCoord.y << ' ' << maxCoord.x << ' ' << maxCoord.y << endl;

    outGraphFile << minGeoCoord.lat << '\t' << minGeoCoord.lon << '\t' << maxGeoCoord.lat << '\t' << maxGeoCoord.lon << endl;

    Geocentric earth(Constants::WGS84_a(), Constants::WGS84_f());
    //Alternatively: const Geocentric& earth = Geocentric::WGS84();

    //Passing Geo Coordinates of BoundingBox
    const double lat0 = minGeoCoord.lat, lon0 = minGeoCoord.lon;
    //make projection...
    LocalCartesian proj(lat0, lon0, 0, earth);

    double x, y, z = 0;//local coordinate contained in .net file
    double lat, lon, h;//retrieved lat lon points from Reverse method
    int i, hasShape; //iterator
    GeoCoord fromCoord;//node from
    GeoCoord toCoord;//node to


    while(!graphFile.eof()){//while file has data
        //read lat lon points from --> to
        cout << "from" << "-->" <<"to" << endl;
        graphFile >> fromCoord.lat >> fromCoord.lon >> toCoord.lat >> toCoord.lon;
        graphFile >> hasShape;

        outGraphFile << fromCoord.lat << '\t' << fromCoord.lon << '\t' << toCoord.lat << '\t' << toCoord.lon;

        cout << fromCoord.lon << ' ' << fromCoord.lat << ' ' << toCoord.lon << ' ' << toCoord.lat << endl;
        cout << hasShape << endl;



        //There are more coordinates to define shape of this edge?
        for(i=0; i < hasShape; i++){
            graphFile >> x >> y;
            cout << x <<','<< y << '\t';
            proj.Reverse(x, y, z, lat, lon, h);
            cout << lat << " " << lon << endl;

            outGraphFile << "\t" << lat << "\t" << lon;

        }

        outGraphFile << endl;
        cout << endl;
    }

    outGraphFile.close();
    graphFile.close();

}
