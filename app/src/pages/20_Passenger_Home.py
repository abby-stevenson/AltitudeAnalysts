import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Passenger Home Page')

if st.button('See the Status of Your Flight', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/21_Flight_Status.py')

if st.button('Access Boarding Pass and Change Class', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/22_Boarding_Pass.py')

if st.button("See All Your Booked Flights",
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/23_Booked_Flights.py')