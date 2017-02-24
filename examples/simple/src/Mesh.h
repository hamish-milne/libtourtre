#ifndef MESH_H
#define MESH_H

#include <vector>

#include "Global.h"
#include "Data.h"

//abstract mesh class
class Mesh 
{
	public:
	
	Data & data;
	Mesh(Data & d) : data(d) {}
	
	void getNeighbors(size_t i, size_t * n, size_t & count);
	void createGraph(std::vector<size_t> & order);
	uint numVerts();
	
	

	void find6Neighbors( uint x, uint y, uint z, size_t * neighbors, size_t & count);
	void find18Neighbors( uint x, uint y, uint z, size_t * neighbors, size_t & count);
	
};

#endif
