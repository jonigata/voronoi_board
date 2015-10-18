import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import Voronoi;

class TacticsBoard {
    var sites: Array<Site> = [];
    var diagram: Diagram;

    public function new() {
        for (i in 0...100) {
            sites.push({x: Math.random() * 960, y: Math.random() * 640});
        }
        
        diagram = new Voronoi().compute(
            sites, {xl: 0, xr: 960, yt: 0, yb: 640});
    }

    public function draw(ctx: CanvasRenderingContext2D) {
        for (cell in diagram.cells) {
            ctx.beginPath();
            ctx.arc(cell.site.x, cell.site.y, 5, 0, Math.PI*2, false);
            ctx.stroke();

            for(halfedge in cell.halfedges) {
                ctx.beginPath();
                if (halfedge.edge.lSite != null && 
                    halfedge.edge.rSite != null) {
                    ctx.moveTo(halfedge.edge.lSite.x, halfedge.edge.lSite.y); 
                    ctx.lineTo(halfedge.edge.rSite.x, halfedge.edge.rSite.y); 
                }
                ctx.stroke();
            }
        }
    }
}
