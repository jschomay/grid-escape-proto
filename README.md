## Grid Escape prototype - html5 game experiment for framework testing and learning

I've done my share of client side apps and games based on user input or turns, but I haven't gotten to play much with bonafide game-loop based games in the browser/mobile, and this is my attempt at that.

One difficulty in getting started is weeding through the [vast multitude of javascript game engines](https://github.com/bebraw/jswiki/wiki/Game-Engines) available (or trying to roll your own).  After a lot of research, I narrowed the list down to a handful of options that I'd like to try.

My plan is to build a simple prototype of a space shooter style game that I've designed in a few of these selected frameworks to get a good helping of experience and hopefully ultimately have a favorite goto framework or two.

### Particular frameworks that look worth checking out
Based on descriptions/approach/recommendations

- __[GameJs]((gamejs.org)__
Based off of pygame, looks solid.  Lots of game examples.

- __[Crafty](http://craftyjs.com/)__
Looks solid and complete.  Component based.  Seems approachable, though guide isn't finished.  Recommended.

- __[Entity](http://entityjs.com/)__
 Similar to Crafty.  Looks complete.  Good tutorials.

- __[LimeJS](http://www.limejs.com/)__
Supports mobile/touch.  Uses Closure Library.  Looks tricky.

- __[Quintus](http://html5quintus.com/)__
Looks very simple and approachable.  Component plus inheritance.  Platformer in 80 lines.  Looks fun to use.  But early in development.

- __[Atom](https://github.com/nornagon/atom)__
Super lightweight canvas framework.  Coffeescript.  Includes game loop, key bindings, and sound library, not much else.  Might be good candidate for rolling your own.

- __[Instant Rocket Fuel](http://kolja.github.com/Instant-Rocket-Fuel/)__
Coffeescript simple framework.  Looks approachable.  Friendly, nice.  Maybe not complete though, young, and small.

- __[Enchant](http://enchantjs.com/)__
Says it's simple, but looks very complete.  Lots of users, seems stable.

- __[EaselJS](http://www.createjs.com/#!/EaselJS)__
Like flash, for javascript.  Recommended by many, very solid, especially since it's now part of Adobe's [CreatJS](http://www.createjs.com/) suite.

- piecemiel / roll your own


Other interesting options/tools worth mentioning:

 - __[PixeEngine](http://pixieengine.com/)__
web-based IDE/game engine.  Coffeescript.  Good docs.  Straightforward.  Component system.  Works, but still in development.

 - __[Pixi](https://github.com/GoodBoyDigital/pixi.js)__
Super fast rendering engine, seems it can be dropped in to other frameworks.

 - __[GameSalad](http://gamesalad.com/creator)__
Not a code framework, but a gui drag and drop framework.  Maybe useful for game prototyping, or for non-coders.


 - __[ProcessingJS](http://processingjs.org/)__
Nifty drawing library for the canvas, useful in piecemiel approach maybe.

 - __[Unity3D](http://unity3d.com/)__
Much more than a simple framework, and focused on 3D, eventually I want to get into this, but I want to go the pure coding route first.

 - __[ImpactJS](impactjs.com)__
 Premium framework, looks very solid, a standard.  Intro video looks fun and easy, I like the map editor.

 - __[MelonJS](http://www.melonjs.org/)__
 Recommended, supposed to be similar to impactjs.

### Plan

_What draws me:_

I'd like to see what Crafty is all about, and people recommend it (but switched to Easel).  Seems easy enough to start with, but it's a differnt style of coding, which I might like or might not.  Entitiy seems interchangible with Crafty, I'll pick which ever one feels better or has better tutorials.

I want to try Easel and think it's the most well known/used.

I like the idea of rolling my own as much as possible.  Atom or IRF would be best for that.  I like coffeescript.  I'd get a chance to experiement with Browserify too.  After I struggle with some game dev concepts, I'll be more able to appreciate what the larger frameworks provide.  Or I'll find my own way to deal with them instead ;).

After coding myself a few times, I do intend to learn Unity.

I'm curious what "cheating" with GameSalad will be like...

At first I ignored ImpactJS since it was premium, but looking at it again, it looks nice...

_What makes me pause:_

I already got started with gameJS, but I didn't like the experience.

Lime's use of closure is a stumbling block for me right now.

Not sure about Enchant, might be great, or might not be, I'll try others first.

I'd really like to use Quintus, but I don't think it's ready.

_So..._

Looks like this is the lineup:

 1. GameJS - already done, pass.
 2. Roll my own.  First try  IFR, switch to Atom if incomplete.
 3. Easel
 4. Crafty.  Switch to Entity if desired (or use for reference).
 5. Enchant
 6. Play with GameSalad afterwards and Unity
 7. If these don't work, try ImpactJS 

### Results

See README in each framework folder for pros, cons, and conclusions.