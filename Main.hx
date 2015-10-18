import js.Browser;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

class Main {
    public static function main() {
        Browser.window.onload = init;
    }

    static function init() {
        var t = new TacticsBoard();
        var canvas: CanvasElement = 
            cast Browser.document.getElementById("canvas");
        var ctx: CanvasRenderingContext2D = canvas.getContext("2d");

        t.draw(ctx);
    }
}