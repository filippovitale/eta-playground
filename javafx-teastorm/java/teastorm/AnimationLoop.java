package teastorm;

import javafx.animation.AnimationTimer;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

/** All credit goes to Mathieu 'p01' Henri – http://www.p01.org/tea_storm/ */
public class AnimationLoop extends AnimationTimer {
    final private Canvas c;
    final private GraphicsContext gc;
    final private long t0;
    final private double n;
    final private double u;
    final private double m;
    final private double s;
    final private double w;
    final private double h;
    final private static double oneMillisecondInNanoTime = 1_000_000.0;

    public AnimationLoop(Canvas c, long t0, double n, double u, double m) {
        this.c = c;
        this.gc = c.getGraphicsContext2D();
        this.t0 = t0;
        this.n = n;
        this.u = u;
        this.m = m;
        this.s = n; // side length
        this.w = c.getWidth();
        this.h = c.getHeight();
    }

    private void clearCanvas() { gc.clearRect(0, 0, w, h); }

    private static double computeIntensity(final double x, final double y, final double s, final double t) {
        double d = 4;
        double e = 1;
        double intensity;

        for (intensity = 4; .1 < e * intensity; intensity -= .1) {
            double X = d * (x / s) - d / 2;
            double Y = d * y / s - d / 2;
            double Z = d / 2 - 9;

            // Sphere
            // e = (X * X + Y * Y + Z * Z) / 15 - 1;
            // e = (X * X + Y * Y + Z * Z) / 9 - 1;

            // Sphere morphing into a cylinder
            // e = (X * X + Y * Y * Math.cos(t / 6) + Z * Z) / 9 - 1;

            // Bumpy sphere
            // e = (X * X + Y * Y + Z * Z) / 9 - 1 + Math.cos(X + t) * Math.cos(Y - t);

            // Bumpy sphere-cylinder
            // e = (X * X + Y * Y * Math.cos(t / 6) + Z * Z) / 9 - 1 + Math.cos(X + t) * Math.cos(Y - t);

            // Bumpy twirling morphing sphere-cylinder \(';;')/
            // e = (X * X + Y * Y * Math.cos(t / 6 + Math.cos(d - X - Y)) + Z * Z) / 9 - 1 + Math.cos(X + t) * Math.cos(Y - t);
            e = (X * X + Y * Y * Math.cos(t / 6 + Math.cos(d - X - Y)) + Z * Z) / 12 - 1 + Math.cos(X + t) * Math.cos(Y - t);
            d += e;
        }

        return intensity / 4;
    }

    public void handle(long currentNanoTime) {
        double t = (currentNanoTime - t0) / (500 * oneMillisecondInNanoTime);

        clearCanvas();
        for (int x = 0; x < n; x++) {
            for (int y = 0; y < n; y++) {
                double i = computeIntensity(x, y, s, t);
                gc.setGlobalAlpha(i);
                gc.fillOval(x * u, y * u, i * m * 1.4, i * m * 1.4);
            }
        }

    }
}
