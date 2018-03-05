
//
// arc_gen: Generate and animate a set of three parametric arcs 
//          (which conspicuosly look like capital C's)
//
// Copyright 2018 Pedro Angelo <pangelo@void.io>
// 
// Distributed under the MIT license, see the file COPYING for details
//

color base_color = color(#000000);
float base_radius = 280;

ParametricArc arcs[];

float last_update = 0.0;

void setup() {
  size (300, 300);
  
  arcs = new ParametricArc[3];
  
  arcs[0] = new ParametricArc();
  arcs[0].pos = 0.0;
  arcs[0].angle = TWO_PI / 2.1;
  arcs[0].thickness = 100;
  arcs[0].shade = color (#FF0000);
  arcs[0].speed = 0.1;
  arcs[0].radius = base_radius * 0.7;

  arcs[1] = new ParametricArc();
  arcs[1].pos = 0.0;
  arcs[1].angle = TWO_PI / 2.1;
  arcs[1].thickness = 70;
  arcs[1].shade = color(#00FF00);
  arcs[1].speed = 0.2;
  arcs[1].radius = base_radius * 0.8;

  arcs[2] = new ParametricArc();
  arcs[2].pos = 0.0;
  arcs[2].angle = TWO_PI / 2.1;
  arcs[2].thickness = 40;
  arcs[2].shade = color(#0000FF);
  arcs[2].speed = 0.3;
  arcs[2].radius = base_radius * 0.8;

  last_update = millis() / 1000.0;
}

void draw() {
  background (255);
  
  float now = millis() / 1000.0;
  float delta = now - last_update; 
  last_update = now;
  
  for (ParametricArc arc : arcs) arc.update (delta);
  
  translate (width/2, height/2);
  
  stroke (base_color);
  fill (base_color);
  ellipse (0, 0, base_radius, base_radius);

  for (ParametricArc arc : arcs) arc.draw();
}
