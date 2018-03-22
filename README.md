# Works For Me

Planning an event can be difficult... and annoying.

Among the many challenges involved, SCHEDULING the event based on your attendees differing availabilities is surely one of the more difficult tasks. It is always a pain when you have to reach out individually to each person, ask when THEY are available, compare it to YOUR availability, and multiply the process by however many people you are inviting...

Enter: <strong>Works For Me</strong>

![UI Screenshot](https://i.imgur.com/UAhzU08.png)

## Getting Started
(http://works-for-me.herokuapp.com/)

### How the app works

1. Create an account
2. Create an event and give it a title & location
3. Add some time slots that work for you first, based on your own schedule (or possible times if you aren't attending and just planning it)
4. Copy the unique URL to your event, and send it to your attendees (still working on auto e-mail functionality)
5. Your attendees receive the invite URL, create an account, and approve any time slot(s) that work for them based on THEIR availability
6. After your attendees approve time slots, you can view your event and see which time was MOST approved, and pick a time slot that works best for everyone involved.

BAM!

## Built With
* Ruby on Rails
* PostgreSQL
* HTML
* CSS (CSS-Grid & Flexbox)
* Deployed on Heroku

## Next Steps
I was a little too ambitious when I set out to create this app from scratch in less than a week... so it doesn't have all the functionality I originally planned... YET! 

In addition to working out the little kinks in the overall functionality/UX/styles, I will be working on adding the following features:

* Allow event creators to add attendees' e-mail addresses to auto-send the invite link 
* Allow users to sync their Google or iCloud calendars to auto-complete availability checking
* Allow users to set their own time zones
* Allow event creators to view WHO is/isn't available for any given time slot
* Add commenting to events (to allow users to discuss the event directly from the event page)

## Acknowledgments
I've gotta give it up to my incredibly brilliant WDI instructors here at General Assembly who taught me how to build an app from scratch using Rails: @jim-clark and @jtamsut. I am so grateful for their wise advice and hours of direction while building the app.

Also big thanks to @excid3 for the "Simple Calendar" gem, which made this project so much easier.