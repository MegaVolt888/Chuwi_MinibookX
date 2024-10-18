#include <stdio.h>
#include <math.h>
#include <stdlib.h>

typedef struct {
    double x, y, z;
} Vector;

double dot_product(Vector v1, Vector v2) {
    return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
}

double vector_length(Vector v) {
    return sqrt(dot_product(v, v));
}

double calculate_angle(Vector v1, Vector v2) {
    double dot = dot_product(v1, v2);
    double len1 = vector_length(v1);
    double len2 = vector_length(v2);

    double cos_theta = dot / (len1 * len2);
    double theta_rad = acos(cos_theta);

    // Vector product for determining the direction
    Vector cross_product = {v1.y * v2.z - v1.z * v2.y,
                           v1.z * v2.x - v1.x * v2.z,
                           v1.x * v2.y - v1.y * v2.x};
    if (cross_product.y < 0) {
        theta_rad = 2 * M_PI - theta_rad;
    }

    return theta_rad * 180 / M_PI;
}

int main(int argc, char *argv[]) {
    if (argc != 5) {
        printf("The number of arguments is incorrect. It is expected on the 4th.\n");
        return 1;
    }

    double x1 = atof(argv[1]);
    double z1 = atof(argv[2]);
    double x2 = atof(argv[3]);
    double z2 = atof(argv[4]);

    Vector v1 = {x1, 0, z1};
    Vector v2 = {x2, 0, z2};

    double angle = calculate_angle(v2, v1);
    printf("%.2f", angle);

    return 0;
}
