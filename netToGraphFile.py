#!/usr/bin/python
from xml.dom import minidom
import sys
import argparse
import matplotlib
from matplotlib import pyplot as plt
import numpy as np

################Begin of Functions to parse XML

#Extract data from the xml format to  alist with ID
#and necessary attributes only
def ExtractDataXML(nodeListXML, edgeListXML, locInformation):
	
	nodeList = list()
	edgeList = list()
	edgeShapeList= list()
	
	with open('myGraph.txt','w') as graphFile:
		
		geographBoundBox = locInformation[0].attributes['origBoundary'].value.split(',')
		localBoundBox = locInformation[0].attributes['convBoundary'].value.split(',')
		
		graphFile.write(geographBoundBox[0]+'\t'+geographBoundBox[1]+'\t'+geographBoundBox[2]+'\t'+geographBoundBox[3]+'\t')
		graphFile.write(localBoundBox[0]+'\t'+localBoundBox[1]+'\t'+localBoundBox[2]+'\t'+localBoundBox[3]+'\n')


		for edge in edgeListXML:
			
			if edge.hasAttribute('from') and edge.hasAttribute('to'):
				
				#Pushing edge Attributes : from, to, weight
				#TODO replace this line by the error of GPS
				#edgeList.append([edge.attributes['from'].value, edge.attributes['to'].value, np.random.random_sample()])
				#Building the dict
				#edgesShape['']
				#Pushing node attributes: id, lat , lon
				#node = FindNodeXML(edge.attributes['from'].value,  nodeListXML)
				#nodeList.append([node.attributes['id'].value, float(node.attributes['lat'].value), float(node.attributes['lon'].value)])
				#node = FindNodeXML(edge.attributes['to'].value,  nodeListXML)
				#nodeList.append([node.attributes['id'].value, float(node.attributes['lat'].value), float(node.attributes['lon'].value)])
				#processing the shape coordinates
				#print(edge.attributes['id'].value)
				#print(edge.hasAttribute('shape'))
				#print(edge.attributes['shape'].value,'\n')

				#Search for nodes lat and lon coordinates
				node = FindNodeXML(edge.attributes['from'].value,  nodeListXML)
				graphFile.write(node.attributes['lat'].value+'\t'+node.attributes['lon'].value+'\t')

				node = FindNodeXML(edge.attributes['to'].value,  nodeListXML)
				graphFile.write(node.attributes['lat'].value+'\t'+node.attributes['lon'].value+'\t')

				#has shape?
				if edge.hasAttribute('shape'):
					stringCoords = edge.attributes['shape'].value
					listCoords = stringCoords.split(' ')
					
					graphFile.write(str(len(listCoords))+'\t')

					for coord in listCoords:
						
						spliter = coord.split(",")
						
						graphFile.write(spliter[0])
						graphFile.write('\t')
						graphFile.write(spliter[1]+'\t')
					graphFile.write('\n')
				else:
					graphFile.write('0\n')
						
	graphFile.close()



#Search for a node with an ID
def FindNodeXML(identifier, nodeList):
	for node in nodeList:
		if node.attributes['id'].value == identifier:
			return node
	print('Referencia de node nao encontrada!') 

#Valid edges in .net file has a 'from' -> 'to' attribute
def IsAValidEdge(edge):
	
	for attr in edge.attributes.items():
		if attr[0] == 'from':
			return True
	return False

#################End of Functions to parse XML	


def FindNode(nodeId,nodeList):
	for node in nodeList:
		if(node[0] == nodeId):
			return node
	
	print("Node not found")

def main(argv):
	#xml files
	oSMFile = minidom.parse('dpt-road-only.osm')
	netFile = minidom.parse('net.net.xml')

	#list with xml attributes
	nodeListXML = oSMFile.getElementsByTagName('node')
	edgeListXML = netFile.getElementsByTagName('edge')
	locInformation = netFile.getElementsByTagName('location')

	#list with graph information
	nodeList = list()
	edgeList = list()
	edgeShapeList = list()

	#parse XML to a list only with necessary attributes
	#For nodes: id, lat lon corrdinates
	#For edges: id, from, to values
	ExtractDataXML(nodeListXML, edgeListXML, locInformation)

if __name__ == "__main__":
    main(sys.argv)





