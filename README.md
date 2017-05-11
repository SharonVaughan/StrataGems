# README

## Design Planning

Goals
 - Connect students with associations
 - Provide information to students about campus events
 - Provide a site to explore the variety of associations and clubs

Vibes / Emotions
 - Sleek
 - Graphic
 - White
 - Professional

Pages
	- Homepage
	- Sign-in/-up/-out
	- CRUD for students, affiliates, meetings

Homepage
 - Title / subtitle
 - Banner
 - Copy for app intent
 - Navigation
 - List of affiliates

Individual association
 - Title / subtitle
 - Banner
 - Copy for affiliate intent
 - Call to action: subscribe to the affiliate
 - Navigation
 - Contact information
 - Google map
 - Meetings

 View all affiliate
 	- Search
 	- List results
 	- List all clubs by alphabet
 	- List all clubs by category
 	- List meeting topic
 	- List meeting content

## This is the structure of my database:
![dbstructure](https://cloud.githubusercontent.com/assets/20434999/25947535/2c841456-3693-11e7-97fc-8b48de7de0f5.png)


## This image describes...
the interconnectivity between the pages of the app. Essentially there are two views of the app; one for the general public to view information about affiliates, the other for those with edit priviledges.

![figma](https://cloud.githubusercontent.com/assets/20434999/25947591/757410ee-3693-11e7-805a-b183f2e51d12.png)

## Gems I am using
There are a number of gems included in the app:
 - Devise: authentication of users
 - Stripe: payment of the affiliate yearly membership
 - acts_as_votable: rating system which I was going to use for students rating a meeting
 - paperclip: allows users to add an avatar to their profile
 - bootstrap: styling the site the easy way
 - searchkick: enables searching of different models... although intend on changing this for Algolia, because it doesn't require a server
	
