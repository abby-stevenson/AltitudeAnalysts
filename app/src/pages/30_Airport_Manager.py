import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('Airport Manager Home Page')

if st.button('See All The Flights Departing From A Specific Terminal', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/31_Flight_Stats_Terminal.py')

if st.button('See Businesses Operating in Your Airport', 
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/32_Businesses.py')

if st.button("Monitor and Update Flight Information",
             type='secondary',
             use_container_width=True):
  st.switch_page('pages/33_Monitor_Flights.py')