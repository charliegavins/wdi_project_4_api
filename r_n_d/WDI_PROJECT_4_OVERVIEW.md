## WDI Project 4 

### **THE PROBLEM**

There is no place online where fans can donate to their favourite artists. You might say that buying music or going to a gig is supporting - which is absolutely right - but there should be a way of directly funding the art you wish to support without the middle man.

A reddit post with quite some interaction suggests that this need is quite acute:

https://www.reddit.com/r/Music/comments/4htudc/why_isnt_there_a_tip_jar_on_spotify_i_would/

9 months old.
43.2k votes
2605 comments

### **THE AIM**

To build a tool that allows the user to donate as much or as little as they would like to an artist of their choice. 

### **NAME/BRANDING**

The project has a working title of 'BreadCrumbs'. Providing a way of supporting - and following - the artists you love.

### **MVP**

#### User Journey

##### Log in/register

Standard jwt authentication process. 
	
##### Select artist/album/track to donate to

Correct artist/album/track to be identified using spotify or musicbrainz search api's

[Spotify API](https://developer.spotify.com/)
	
[MusicBrainz API](https://musicbrainz.org/doc/MusicBrainz_Database)

##### Select amount to donate, with accompanying message and set contact details
 
Simple form, to be added to DB on submit
	
##### Donate

Donations will be in bitcoin only. Despite relatively low adoption, the benefits here are of very low processing fees, and ability to set up new wallets on the fly for individual accounts.
	
[Brave browser](https://www.brave.com/), founded by Brendan Eich has adopted this approach which gives the strategy a good level of legitimacy.

[OpenBazaar](https://openbazaar.org/) is rekindling the early days of ebay with it's blockchain based merchant portal.
	
The MVP would use an external wallet api such as those provided by [Blockchain](https://blockchain.info/api), [Coinbase](https://developers.coinbase.com/) and more. To be researched to find optimal product
	
Requirements of API

* ability to generate and load wallets programmatically (no need for human authorization)*
* Fast (seconds rather than minutes or hours)

##### Check on status of donation (whether delivered or not) on profile page

Delivered or not to be updated by the admin account. Once donations are recieved, the recipient or their representatives are contacted personally to open up this revenue stream to them.


#### MVP 'nice to haves'

* Admin account functionality which will allow for a GUI interaction and administration of the database/userbase
* Import Spotify saved artists and playlists so users can browse the list of their online library and select donation recipients from there.
* Import iTunes listening data (via physical XML) so users can donate a set amount split on the basis of who they listen to in a given time period.

	E.g. 

	A simplified illustration below:

	$10 per month split evenly depending on listens:

	25% Arcade Fire - $2.50<br>
	30% Nine Inch Nails - $3.00<br>
	25% Bon Iver - $2.50<br>
	20% Skepta - $2.00<br>
* New release notification systems on Spotify and other services are very unreliable so providing an update for new releases on the homepage for user's artists would be a good feature
* Live show data from [SongKick](https://www.songkick.com/developer) 
* For an added fee users can select to send their donation and message physically, which will see the message they write get rendered and printed into a card that is then mailed to the artist.





