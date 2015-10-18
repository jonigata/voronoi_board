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
        tieClosest();
        
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

    function tieClosest() {
        function distance(a: Site, b: Site) {
            var dx = a.x - b.x;
            var dy = a.y - b.y;
            return Math.sqrt(dx*dx+dy*dy);
        }

        while(true) {
            // calculate nearest
            var nearestDistance = 99999.0;
            var nearestA = -1;
            var nearestB = -1;
            for (i in 0...sites.length) {
                for (j in (i+1)...sites.length) {
                    var d = distance(sites[i], sites[j]);
                    if (d < nearestDistance) {
                        nearestDistance = d;
                        nearestA = i;
                        nearestB = j;
                    }
                }
            }

            if (100.0 < nearestDistance) {
                break;
            }

            // tie
            var newSites = [];
            for (i in 0...sites.length) {
                if (i == nearestA || i == nearestB) {
                } else {
                    newSites.push(sites[i]);
                }
            }
            var a = sites[nearestA];
            var b = sites[nearestB];
            newSites.push({x: (a.x + b.x) * 0.5, y: (a.y + b.y) * 0.5});
            sites = newSites;
        }
    }
}
