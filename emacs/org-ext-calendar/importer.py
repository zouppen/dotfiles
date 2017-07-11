#!/usr/bin/env python
# Import due dates from external systems into a simple orgmode agenda file.

from os import environ
import requests
# import tempfile
from datetime import datetime
from dotenv import load_dotenv
# from korppi import get_korppi_events

load_dotenv(environ['HOME'] + '/.keys')

TRELLO_KEY = environ['TRELLO_KEY']
TRELLO_TOKEN = environ['TRELLO_TOKEN']
    # KORPPI_ICAL = environ['KORPPI_ICAL']

orgfile = ''

##### Trello

try:
    r = requests.get("https://trello.com/1/members/my/boards?key=%s&token=%s" %(TRELLO_KEY, TRELLO_TOKEN))
except:
    print "ERROR: Couldn't get data from Trello"
    exit(1)

my_boards = r.json()

for board in my_boards:
    if not board['starred']:
        continue
    print("Reading Trello board " + board['name'])

    board_id = board["id"]
    cards = requests.get("https://trello.com/1/boards/%s/cards?key=%s&token=%s" %(board_id, TRELLO_KEY, TRELLO_TOKEN)).json()
    orgfile += ( '* %s\n' % board['name'] )
    orgfile += ( '#+category: %s\n' % board['name'] )
    orgfile += ( '%s\n' % board['shortUrl'] )

    for card in cards:
        if card["due"]:
            card_name = card["name"]
            card_due  = card["due"].split("T")[0]
            orgfile += ( '** %s\n' % card_name )

            # Use <> for future and [] for past
            card_due_dt = datetime.strptime(card_due, "%Y-%m-%d")
            now_dt = datetime.now()
            since = now_dt - card_due_dt

            # TODO days time?
            if (since.days > 0):
                orgfile += ( 'SCHEDULED: [%s]\n' %(card_due) )
            else:
                orgfile += ( 'SCHEDULED: <%s>\n' %(card_due) )

            orgfile += card['shortUrl'] + '\n'


##### Korppi

# korppi_events = get_korppi_events(KORPPI_ICAL)
# orgfile += '* Korppi\n#+CATEGORY:JYU\n'
# for event in korppi_events:
#     orgfile += '** %s [%s] :jyu:\n' % (event['description'], event['location'])
# 
#     datestr = datetime.strftime(event['timestamp'], "%Y-%m-%d %H:%M")
#     now_dt = datetime.now()
#     since = now_dt - event['timestamp']
# 
#     if (since.days > 0):
#         orgfile += ( 'SCHEDULED: [%s]\n' %(datestr) )
#     else:
#         orgfile += ( 'SCHEDULED: <%s>\n' %(datestr) )


    ## TODO gmaps link

# Google Calendar

#### Write to file
orgfile = orgfile.encode('utf-8')
f = open(environ['HOME'] + '/.ext-calendar.org', 'w')
f.write(orgfile.strip())
f.close()
