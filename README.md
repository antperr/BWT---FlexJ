# BWT---FlexJ
App project for Biomedical Wearable Technology for Healthcare and Wellbeing

This application aims to show user's activity along the month

1- Login: get a fitbit account ang log into the app
2- Profile: set personal parameters and activity goal -> ([MaxSteps] [Object] [])
3- Initial Fetch: get the newest data available, plus the last 24H of HB
4- Show: show current data compared to set tresholds
5- Save: only mean values if not lready present in the DB

DB: 2 Tables -> 1 table indicizes the user with pw & ID
             -> 1 table (primary key: userID) to save ( [DAY] [STEPS] [SLEEP] [RECHED OBJECTIVES] [CAL]) for each day (secondary key)


