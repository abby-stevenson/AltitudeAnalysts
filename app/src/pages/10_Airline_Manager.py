import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Airline Manager, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Your Airlines Flight Statistics', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/11_Flight_Stats.py')

if st.button('Add Flights', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/12_Add_Flights.py')

if st.button("Remove Flights",
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/13_Remove_Flights.py')