/*

Version History

Version 3 (posted 03-15-2012)
 * Updated the world.GetServers proc to use savefiles to read the
   information returned by the BYOND hub.
 * Added the world.GetFans() proc, which returns a list of users who
   are fans of the specified hub entry. If no hub entry is specified,
   the proc uses world.hub.

Version 2 (posted 02-11-2012)
 * Made the world.GetServers proc accept a single string of the
   form "author.game". If you pass it one string it splits the
   string - everything before the period is the author and everything
   after it is the game's name.
 * Made the world.GetServers proc handle the case that no servers
   are running.
 * Added the score-demo example which shows how to abstract out the
   library to make hub scores even easier to use.

Version 1 (posted 12-15-2011)
 * Initial version.


*/