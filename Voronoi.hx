typedef Site = {
  x: Float,
  y: Float,
};

typedef Vertex = {
  x: Float,
  y: Float,
};

typedef Edge = {
  lSite: Site,
  rSite: Site,
  va: Vertex,
  vb: Vertex,
};

typedef HalfEdge = {
  site: Site,
  edge: Edge,
}

typedef Cell = {
  site: Site,
  halfedges: Array<HalfEdge>,
};

typedef Diagram = {
  vertices: Array<Vertex>,
  edges: Array<Edge>,
  cells: Array<Cell>
}

extern class Voronoi {
    public function new();
    public function compute(sites: Array<Site>, bbox: {xl: Float, xr: Float, yt: Float, yb: Float}): Diagram;
}
