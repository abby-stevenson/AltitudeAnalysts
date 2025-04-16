import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Travel Agent, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Search for Flights', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/01_Travel_Agent_Search_Flights.py')

if st.button('Add a New Passenger', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/03_Add_Passenger.py')

if st.button('View Flights Customers Have Been Booked Onto', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/04_Customer_Flights.py')

