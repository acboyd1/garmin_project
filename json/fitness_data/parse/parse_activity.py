import pandas as pd
import json
import os
#-----------------------------------------------------------------------------------------#
files = os.listdir('data')

# Filter the list to only json files
json_files = [file for file in files if file.endswith('.json')]

# temp_frame = []

for file in json_files:
    with open(os.path.join('data', file)) as f:
        data = json.load(f)
    # temp_frame.append(pd.json_normalize(data))

# df = pd.concat(temp_frame, ignore_index=True)

activities = data[0]["summarizedActivitiesExport"]

# Convert the list to a pandas DataFrame
df = pd.json_normalize(activities)

df.to_csv('activities.csv', index = False)