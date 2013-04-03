### Trying out [GameJs](http://gamejs.org/) framework

GameJS is a port of pygame.  It aims to provide a canvas drawing api and some useful game tools.  

#### Pros
- Based off of pygame, so has some solid background (but still activly updated with quite a few remaining issues).  Might be a con too.
- Good selection of games built with gameJs as examples, lots from the developer of gamejs.
- Runs well/quick
- Not too complex to understand or get started with

#### Cons
- tightly bound to [yabble](https://github.com/jbrantly/yabble) browser loader, which I don't like/want to use/not familyar with
 - debugging is hard - doesn't show line numbers/files in consol
 - could probably configure it differently, but I don't know how and don't want to mess with wrapping each module
 - could use a modified version of gameJs, but don't want to mess with that
 - I prefer other build tools anyway, like [browserify](browserify.org)
- small/inactive community (there is a google group and irc and stuff, but I didn't find it overly helpful)
- docs/getting started/tutorials leave somethign to be desired
- certain expected tools (like sprite sheet animations or scene management) aren't baked in, but there's some sample code for you to add yourself.
- feels "old" (even though commits are recent), especially the website

####Conclusion
While it is entirely possible that I'm just not familiar enough with gameJs to give it a fair try, I found it frustrating to use.  I spent more time messing with yabble than getting to use the api.  After failing to find a semi-simple way to get line numbers in my debug log I decided I would waste too much time debugging, and was lured to try another framework, or a piecemeal approach.