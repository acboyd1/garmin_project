# Garmin Project
Python scripts for parsing sleep and activity .json files from the garmin connect export.

## _Important Notes_
At the moment, this project is intended for people with Garmin Connect accounts. I cannot vouch for the viability of any other data exports, but would not be surprised if there is a way to edit the programs in order for them to work. This project requires that you request a Garmin data export, which can be done by logging in to Garmin Connect on a computer. For brevity's sake, you can export the **Activities.csv** file directly from the Garmin Connect activity page.

## Overview
Our goal is to receive two different .csv files from our Garmin export that we can bring into a Jupyter Notebook in order to build our insight graphs. These files will be named **sleep_final.csv**, which contains pertinent sleep metrics that the watch has gathered. The other file will be named **activities_final.csv**, and will contain all activities and their data fields.

 Once we have working .csv's, we will import them into a Jupyter Notebook and do some preprocessing before graphing. This is to make sure that formatting across the two documents aligns and we can clearly understand the correlations we are making.

## Instructions

