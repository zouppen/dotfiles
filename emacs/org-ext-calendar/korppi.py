import requests
from icalendar import Calendar
from os import environ
from operator import itemgetter

import calendar
from datetime import datetime, timedelta

# TODO Room lat/lon data for gmaps link
room_locations = {}


def utc_to_local(utc_dt):
        # get integer timestamp to avoid precision lost
        timestamp = calendar.timegm(utc_dt.timetuple())
        local_dt = datetime.fromtimestamp(timestamp)
        assert utc_dt.resolution >= timedelta(microseconds=1)
        return local_dt.replace(microsecond=utc_dt.microsecond)

def get_korppi_events(url):
    print('Loading ical data from ' + url)
    req = requests.get(url)
    cal = Calendar.from_ical(req.text)

    events = []
    for event in cal.walk('vevent'):
        if event.get('location') is not None:
            ev_short = event.get('location')[:2]

        # events.append({'loc': event.get('location'),
        #                'date': event.get('dtstart').dt.date(),
        #                'time': utc_to_local(event.get('dtstart').dt).time(),
        #                'description': event.get('summary'),
        #                'lat': room_locations[ev_short]['lat'],
        #                'lon': room_locations[ev_short]['lon']})

        events.append({'location': event.get('location'),
                       'timestamp': datetime.combine(
                           event.get('dtstart').dt.date(),
                           utc_to_local(event.get('dtstart').dt).time()),
                       'description': event.get('summary')})
    events.sort(key=itemgetter('timestamp'))
    return events
    

