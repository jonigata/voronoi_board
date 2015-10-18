import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

typedef Node = {
  x: Float,
  y: Float
};

class TacticsBoard {
    var nodes: Array<Node> = [];

    public function new() {
        for (i in 0...100) {
            nodes.push({x: Math.random() * 960, y: Math.random() * 640});
        }
    }

    public function draw(ctx: CanvasRenderingContext2D) {
        for (node in nodes) {
            ctx.beginPath();
            ctx.arc(node.x, node.y, 5, 0, Math.PI*2, false);
            ctx.stroke();
        }
    }
}
