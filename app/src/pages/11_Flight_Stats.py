import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

# Display the appropriate sidebar links for the role of the logged in user
SideBarLinks()

# Person 2: Airline Manager, User Stories 1 - 5

st.title('Flight Statistics')
airline_manager_input = st.text_input("Enter the Airline ID:")

if st.button("Submit"):
    if not airline_manager_input.isdigit():
        st.warning("Please enter a valid numeric Airline ID")
    else:
        airline_id = int(airline_manager_input)
    try:
        


st.write("## Average Occupancy Rate")
