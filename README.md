# Dear-Data-Project-
Dear Data - Genshin Impact Login Visualisation

This project is a virtual data-art visualisation inspired by The DEAR DATA project. My project tracks and visualises my daily login activity from a game I usually spend my free time on - Genshin Impact. I implemented Processing ( Java ) to represent my data. Each login day is coordinated with an element icon from Genshin Impact, creating a compact and aesthetic 14 day grid based representation of 100 days of gameplay behaviour.

## PROJECT SUMMARY

From September 1st to December 9th 2025, I collected data based on whether I logged into Genshin Impact every day. When I did login, I recorded:

Date
Element of the day based on the rules i created,
Whether I opened the game or not ( Represented by 1 = opened and 0 = not )

Each day is represented visually using one of the SEVEN Genshin elements:
MONDAY = PYRO
TUESDAY = HYDRO
WEDNESDAY = GEO
THURSDAY = ELECTRO
FRIDAY = CRYO
SATURDAY = ANEMO
SUNDAY = DENDRO

During the 100 days, i recorded my login habits using a digital diary.

## DATA FORMAT

I converted my notes into a CSV File, Called "My Dear Data Login Collections.csv" containing:
date = The calendar date
opened = 1 if I logged in, 0 if I did not.
element = The element assigned via weekday

This file is loaded into Processing and used to populate the visual grid.

## VISUALISATION

My Processing Sketch generates:
A compact grid of the entire data range in a 14 day rotation.
Each cell contains the date, element icon ( if logged in ) or a faint X (if not logged in).
A title summarising the dataset.
Icons for the seven elements are loaded and displayed at a scaled size to fit neatly in the grid

## TECHNOLOGY USED
- Processing ( JAVA )
- CSV Data Handling

## Purpose and Inspiration

My project is inspired by the DEAR DATA art series, which transforms personal behaviour into hand-designed visual patterns. Instead of representing my data by hand, my version uses Processing to create a digital postcard, turning my everyday gameplay habits into a structured artistic pattern. It demonstrates how often I returned to the game and shows visual rhythms tied to the weekly element cycle that I created.

## How to Install
1. Download or clone repository
2. Open the .pde file in Processing
3. Run the Dear-Data-Project in Processing.
  

