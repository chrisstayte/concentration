# Concentration
A game of memory - written in flutter

Card memory is a game where you have to click on a card to see what image is underneath it and try to find the matching image underneath the other cards.

web - https://chrisstayte.app/Concentration

<a href="https://apps.apple.com/us/app/concentration-game-of-memory/id1611268851?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1646006400&h=a22d7834a72eafdbbc38e0d693d85a08" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>

<a href='https://play.google.com/store/apps/details?id=com.chrisstayte.concentration&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img style="width: 290px;"  alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/></a>

## **User Stories**
- [X] User can see a grid with n x n cards (`n` is an integer). All the cards are faced down initially (`hidden` state)
- [X] User can click a button to start the game. When this button is clicked, a timer will start
- [X] User can click on any card to unveil the image that is underneath it (change it to `visible` state). The image will be displayed until the user clicks on a 2nd card

When the User clicks on the 2nd card:

- [X] If there is a match, the 2 cards will be eliminated from the game (either hide/remove them or leave them in the `visible` state)
- [X] If there isn’t a match, the 2 cards will flip back to their original state (`hidden` state)
- [X] When all the matches have been found, the User can see a dialog box showing a Congratulations message with a counter displaying the time it took to finish the game

## **Bonus features**

- [X] Use can choose between multiple levels of difficulty (Easy, Medium, Hard). Increased difficulty means: decreasing the time available to complete and/or increasing the number of cards
- [X] User can see the game statistics (nr. of times he won / he lost, best time for each level)

## **Useful links and resources**

- [Wikipedia](https://en.wikipedia.org/wiki/Concentration_(game))
