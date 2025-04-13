import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
from modules.nav import SideBarLinks
import requests

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# user 1, 1 and 3
# /f/flight_searching/{date1}/{date2}
# /f/flight_searching/{airlineID}

# "http://api:4000/f/flight_searching/<date1>/<date2>"

col1, col2, col3 = st.columns(3)

response = requests.get("http://api:4000/f/flight_searching/<date1>/<date2>")
response = requests.get("http://api:4000/f/flight_searching/<airlineID>")

# Add select box to the first column
with col1:
    text_input = st.text_input(
    "Search Flights",
    key="placeholder")
    st.write(text_input)
    date = st.selectbox("Dates", ["3/4", "3/5", "3/6"])
    airline = st.selectbox("Airline", ["United", "Spirit", "RyanAir"])
    price = st.selectbox("Price", ["$450", "$250", "$20"])
    num_stops = st.selectbox("Stops", ["0", "1", "2"])
    duration = st.selectbox("Total Duration", ["180", "450", "320"])

# Add select box to the second column
with col2:
    option1 = st.selectbox("From", ["BOS", "LHR", "LTN"])

with col3:
    option2 = st.selectbox("To", ["BOS", "LHR", "LTN"])
