/*

  -- Map Instancing --

This library lets you create and manage copies of maps. While the game
is running you can create a duplicate instance of an existing map. The
library will automatically create additional z levels for these new
instances. When you're done using a map the library will re-use z levels
so you can conserve space.


  -- How to Use It --

The library comes with two demos, each is contained in its own sub-
folder. To run a demo, include all of the files in the sub-folder and
run the library. Some demos may have additional instructions, so check
the "demo.dm" file in the demo's folder.

To create a copy of a map you just have to do this:

	var/Map/map = maps.copy(2)

This creates a copy of the second z level. The copy is created on the
first available z level (or, if none are available, a new one is created).
The Map object is returned so you can manage the new map instance:

	mob.loc = locate(5, 3, map.z)

	map.repop()

	map.free()

The Map object has a "z" var which tells you what z level the map copy
was created on. This lets you move mobs to the new map. The object also
has some procs. The repop() proc creates new instances of objects to
replace deleted ones - it's like world.Repop() except it only repopulates
that one map instance. The free() proc tells the library that you're done
using the map, this way the library can use that z level again later.


  -- Version History --

Version 3 (posted 10-12-11)

 * Added saving and loading and a demo that shows how to
   use it - see saving-and-loading-demo\demo.dm

Version 2 (posted 10-12-11)

 * Added the maps.clear() proc to free up existing z levels (even
   ones that weren't dynamically created by the library).

Version 1 (posted 10-11-11)

 * Initial version

*/