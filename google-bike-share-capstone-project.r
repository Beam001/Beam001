{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "bd50793a",
   "metadata": {
    "_cell_guid": "5b450f65-a794-400f-b162-deb971929c3f",
    "_uuid": "678489c5-d07a-49c3-8c01-a2ebba02e186",
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.002618,
     "end_time": "2022-08-28T23:52:09.892447",
     "exception": false,
     "start_time": "2022-08-28T23:52:09.889829",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "---\n",
    "title: \"Google_Capstone_Project\"\n",
    "author: \"Segun\"\n",
    "date: \"2022-08-28\"\n",
    "output: html_document\n",
    "---\n",
    "\n",
    "```{r setup, include=FALSE}\n",
    "knitr::opts_chunk$set(echo = TRUE, eval = FALSE)\n",
    "```\n",
    "\n",
    "## INTRODUCTION\n",
    "\n",
    "As a data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago, I have been tasked to analyze 12 months historical trip data of annual members and casual riders to investigate some trends between these two classes of riders. This is in a bit to understand how to best ensure future success of Cyclistic. \n",
    "\n",
    "# Background\n",
    "\n",
    "In 2016, Cyclistic launched a successful bike-share oﬀering. Since then, the program has grown to a ﬂeet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.\n",
    "\n",
    "Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the ﬂexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.\n",
    "\n",
    "Cyclistic’s ﬁnance analysts have concluded that annual members are much more proﬁtable than casual riders. Although the pricing ﬂexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.\n",
    "\n",
    "Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders diﬀer, why casual riders would buy a membership, and how digital media could aﬀect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.\n",
    "\n",
    "The following questions were identified to help the execution of this new strategy; \n",
    "1.\tHow do annual members and casual riders use Cyclistic bikes diﬀerently?\n",
    "2.\tWhy would casual riders buy Cyclistic annual memberships? and\n",
    "3.\tHow can Cyclistic use digital media to inﬂuence casual riders to become members?  \n",
    "I have been mandated to answer the first question by analyzing the trip data from the last 12 months which can be found here. This data has been made available by Motivate International Inc. under this license. \n",
    "\n",
    "# Business Task\n",
    "I am to analyze the last 12 months trip data to analyze the difference(s) in the usage Cyclistic Bikes by the annual members and casual riders. \n",
    "\n",
    "# Key Stakeholders\n",
    "Lily Moreno: The director of marketing and my manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. \n",
    "Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. \n",
    "Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program. \n",
    "\n",
    "\n",
    "# Data Source \n",
    "Although Cyclistic is a fictional name, however its data source came from a very reliable source which by narration above can be termed an “internal data” which is one of the most reliable form of data. It is also original and is devoid of any Personally Identifiable Information (PII). \n",
    "It is quite current and comprehensive enough for the analysis. Our data is a public data and can be found at  (https://divvy-tripdata.s3.amazonaws.com/index.html) and the license can be found at https://www.divvybikes.com/data-license-agreement. \n",
    "I downloaded the last 12 months of the data sets to ensure that the most current behavior is analyzed and understood. When downloaded, they were unzipped and saved on a local drive with the name (Monthly_Trip_Data). Sub folders were created to keep the RAW files and another to keep the PROCESSED file and the final one will host the ANALYSED file. \n",
    "\n",
    "\n",
    "# Process\n",
    "Cleanups is done using Excel spreadsheet on my local PC. I chose the Excel already on my PC because of unstable internet connection that may affect the speed of Google Sheets. \n",
    "The following was done to each of the files;\n",
    "Each of the CSV was opened in Excel and two new columns were created to add; 1. Ride Length – this is the time it took from the start of the ride to when the bike was returned or when the ride ended. 2. The Day of the week that the bike was used. This two information will help us to see if there is any pattern in the way casual riders and annual members use the bike-share. \n",
    "To calculate the Ride length, I used (=D2-C2) D2 is the first cell of the end ride time while C2 is the corresponding start ride time. I then formatted the result to time format of 00:00:00 after which I populated for the whole column. \n",
    "The Weekday was done with the formular (=weekday(C2,1)). This gives a corresponding number value of Sunday = 1 through to Saturday = 6 in a sequential order. \n",
    "After these, I went through each of the column header to ensure consistency. I also checked for blanks in the columns using the filter tool. \n",
    "\n",
    "\n",
    "## Analysis\n",
    "Analyzing 12 months trip data means analyzing about 5 million rows of data. Apparently, it is better to choose SQL or R. I chose R as the preferred tool.\n",
    "The following packages were installed and loaded for analysis and visualization in R. Some further analysis will be done in Tableau. \n",
    "\n",
    "#install and load packages \n",
    "\n",
    "```{r load packages}\n",
    "\n",
    "library(tidyverse)\n",
    "library(ggpubr)\n",
    "library(here)\n",
    "library(skimr)\n",
    "library(janitor)\n",
    "library(lubridate)\n",
    "library(ggplot2)\n",
    "library(dplyr)  \n",
    "library(tidyr)\n",
    "library(readr)\n",
    "```\n",
    "\n",
    "#Change directory to host folder\n",
    "\n",
    "```{r directory, warning=FALSE}\n",
    "getwd()\n",
    "setwd(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\")\n",
    "\n",
    "```\n",
    "\n",
    "#import data sets and change name to ds1 - ds12\n",
    "\n",
    "```{r read.csv}\n",
    "ds1 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202108-divvy-tripdata_processed.csv\")\n",
    "ds2 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202109-divvy-tripdata_processed.csv\")\n",
    "ds3 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202110-divvy-tripdata_processed.csv\")\n",
    "ds4 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202111-divvy-tripdata_processed.csv\")\n",
    "ds5 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202112-divvy-tripdata_processed.csv\")\n",
    "ds6 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202201-divvy-tripdata_processed.csv\")\n",
    "ds7 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202202-divvy-tripdata_processed.csv\")\n",
    "ds8 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202203-divvy-tripdata_processed.csv\")\n",
    "ds9 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202204-divvy-tripdata_processed.csv\")\n",
    "ds10 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202205-divvy-tripdata_processed.csv\")\n",
    "ds11 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202206-divvy-tripdata_processed.csv\")\n",
    "ds12 <- read.csv(\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\PROCESSED\\\\202207-divvy-tripdata_processed.csv\")\n",
    "```\n",
    "\n",
    "\n",
    "# Create the Data Frame\n",
    "\n",
    "```{r}\n",
    "# Based on the processes done in Excel, it is clear that datasets has same structur using bind_rows we combine all the datasets into one called trips_data\n",
    "\n",
    "trips_data <- bind_rows(ds1, ds2, ds3, ds4, ds5, ds6, ds7,\n",
    "                    ds8, ds9, ds10, ds11, ds12)\n",
    "\n",
    "#a quick check of the dataframe \n",
    "\n",
    "colnames(trips_data)\n",
    "str(trips_data)\n",
    "glimpse(trips_data)\n",
    "```\n",
    "\n",
    "# Cleanups \n",
    "\n",
    "```{r cleanups}\n",
    "# I noticed that time and date for ride start time and end time is \n",
    "# Character as instead of datetime using lubridate function, it will\n",
    "# converted to proper datetime dttm\n",
    "\n",
    "trips_data$started_at <- lubridate::mdy_hm(trips_data$started_at)\n",
    "\n",
    "trips_data$ended_at <- lubridate::mdy_hm(trips_data$ended_at)\n",
    "\n",
    "\n",
    "#change ride_length from Character to Time Period\n",
    "\n",
    "trips_data$ride_length <- difftime(trips_data$ended_at,\n",
    "                        trips_data$started_at, units = \"mins\")\n",
    "glimpse(trips_data)\n",
    "\n",
    "\n",
    "#check the minimum and maximum ride length\n",
    "min(trips_data$ride_length)\n",
    "max(trips_data$ride_length)\n",
    "\n",
    "#minimum is less than 0. any field less than 0 must be cleaned off\n",
    "\n",
    "trips_data_v2 <- trips_data %>% \n",
    "  filter(ride_length > 0)\n",
    "\n",
    "#confirm if cleaned\n",
    "min(trips_data_v2$ride_length)\n",
    "max(trips_data_v2$ride_length)\n",
    "```\n",
    "\n",
    "# Save a cleaned version of dataset\n",
    "\n",
    "```{r}\n",
    "# remove any column not needed for visual analysis to reduce file size\n",
    "# ensure this is saved as a version 2 to preserve original data\n",
    "trips_data_v2$start_station_name = NULL\n",
    "trips_data_v2$start_station_id = NULL\n",
    "trips_data_v2$end_station_name = NULL\n",
    "trips_data_v2$end_station_id = NULL\n",
    "\n",
    "trips_data_v2$start_lat = NULL\n",
    "trips_data_v2$end_lat = NULL\n",
    "trips_data_v2$start_lng = NULL\n",
    "trips_data_v2$end_lng = NULL\n",
    "\n",
    "#create new column for day of week and month\n",
    "trips_data_v2$day_of_week <- weekdays(trips_data_v2$started_at)\n",
    "trips_data_v2$month <- format(as.Date(trips_data_v2$started_at), \"%b\")\n",
    "\n",
    "str(trips_data_v2)\n",
    "head(trips_data_v2, 10)\n",
    "tail(trips_data_v2, 10)\n",
    "glimpse(trips_data_v2)\n",
    "\n",
    "#column names changed from \"rideable_type\" to \"bike_type\"\n",
    "# and \"member_casual\" to \"user_type\"\n",
    "\n",
    "trips_data_v2 <- trips_data_v2 %>% \n",
    "  rename(bike_type = rideable_type) %>% \n",
    "  rename(user_type = member_casual) %>% \n",
    "  glimpse()\n",
    "\n",
    "\n",
    "summary(trips_data_v2)\n",
    "\n",
    "colnames(trips_data_v2)\n",
    "```\n",
    "\n",
    "# export for visualization and further analysis in Tableau\n",
    "\n",
    "```{r}\n",
    "\n",
    "write.csv(trips_data_v2,\"C:\\\\Users\\\\BEAMS\\\\Documents\\\\Monthly_Trip_Data\\\\ANALYZED\\\\analyzed_trips_v2.csv\", row.names = FALSE)\n",
    "```\n",
    "\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 3.850971,
   "end_time": "2022-08-28T23:52:10.015154",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-08-28T23:52:06.164183",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
