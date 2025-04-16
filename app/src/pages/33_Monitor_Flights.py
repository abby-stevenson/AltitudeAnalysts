import streamlit as st
st.set_page_config(layout = 'wide')
import logging
logger = logging.getLogger(__name__)
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks
from datetime import datetime
SideBarLinks()


st.write("# Update the Gate for Flights")

Flight_input = st.text_input("Enter Flight Number:", key="FlightNumber")
Gate_input = st.text_input("Enter New Gate Number:", key="GateNumber")

if st.button("Change Gate"):
    try:
        response = requests.put(f"http://api:4000/z/flights/{Flight_input}/{Gate_input}")

        if response.status_code == 200:
            st.success("Gate updated successfully!")
        else:
            st.warning(f"Failed to update gate. Status code: {response.status_code}")

    except Exception as e:
        st.warning(f"Error: {e}")




