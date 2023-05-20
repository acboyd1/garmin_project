import pandas as pd
from datetime import datetime
import os

os.chdir('data')

# Load the csv file
df = pd.read_csv('sleep.csv')

# There are three vals we can keep sleep for; put them in an array, and then keep the ones that contain one of the values
vals = ['ENHANCED_CONFIRMED', 'ENHANCED_CONFIRMED_FINAL', 'AUTO_CONFIRMED_FINAL']

df = df[df['sleepWindowConfirmationType'].isin(vals)]

# Convert sleep start and end columns to datetime for ease of edit
df['sleepStartTimestampGMT'] = pd.to_datetime(df['sleepStartTimestampGMT'])
df['sleepEndTimestampGMT'] = pd.to_datetime(df['sleepEndTimestampGMT'])

# Add a total sleep time column using datetime methods
df['sleepTotalTimeStampGMT'] = (df['sleepEndTimestampGMT'] - df['sleepStartTimestampGMT']).dt.total_seconds()
df['sleepTotalTimeStampGMT'] = pd.to_datetime(df['sleepTotalTimeStampGMT'], unit='s').dt.strftime('%H:%M:%S')

# Sort by time; use sleep start date
df = df.sort_values('calendarDate')

# Save the cleaned data to a new csv file
df.to_csv('sleep_final.csv', index = False)