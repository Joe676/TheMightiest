# Initial design

This document describes initial decisions on the UX and architecture of the app.

## App architecture

Application front-end will be created using Flutter and Firebase will be used as the backend & database.
The app will use data from [Marvel's API](https://developer.marvel.com/). The necessary character data will be filtered and uploaded to firebase using a python script. This is to:

-   Allow easier/uniform access to all data from within the app (both our proprietary and external data will be stored in one place.)
-   Circumvent the max 3000 calls/day restriction of the API.

## Views

App will consist of three main views:

1. Voting
    - The user may vote for one of two randomly chosen heroes. Their stats are updated accordingly.
2. Stats
    - A list of all heroes is displayed with statistics of their votes. They will be sorted by voting stats or alphabetically
3. Character page
    - Detailed character info.

## In-app data flow

1. On turning on the app the data on all characters is fetched from DB. This data will be used to populate _Stats View_, and to showcase characters for _Voting_.
2. When data is ready, two random characters are chosen for the _Voting View_. Their IDs are stored in process memory and used to show appropriate names and pictures, and to publish the vote.
3. New random characters are chosen again after casting a vote.
4. When switching to _Voting View_ (either when app is started and ready, or switching from other view) the pictures for current characters are downloaded from the internet (in-memory only the links to resources are stored.)
5. On switching to a _Character View_ details on this character are downloaded from DB.

## Use-case analysis

Here is a (_probably incomplete_) analysis of some use cases (instead of a "use-case diagram"):

1. User turns on the app.
    1. Internet connection and permissions are checked.
    2. If not enough permissions were provided a proper error information pops up (possibly with a call-to-action.)
    3. If there is no internet connection a pop-up is presented asking user to "try later" 
    4. Otherwise, app turns on normally, data is downloaded and _Voting View_ is displayed.
2. User casts a vote
    1. User checks current showdown consisting of two Marvel characters, their names and pictures.
    2. User decides on their vote, to the best of their interest.
    3. User taps (clicks) selected hero.
    4. The information about this vote is sent to database.
    5. Information on these two characters is updated.
    6. New set of characters is selected.
3. User checks stats of the entire line-up.
    1. User navigates to the _Stats View_ by tapping (clicking) the appropriate icon.
    2. On the _Stats View_ user may see stats of the entire line-up.
4. User checks stats of a certain character.
    1. User navigates to the _Stats View_ as described above.
    2. User finds desired character by means of sorting and scrolling through the entire line-up.
    3. User taps (clicks) the character's row, thus navigating to the _Character View_.
    4. User is presented with various info on the selected character.


