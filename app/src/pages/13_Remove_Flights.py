import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks
import datetime

SideBarLinks()

st.write("# Delete Flight Information")

with st.form("delete_form"):
  option = st.radio(
      "Choose an action:",
      ["Delete flight"],
      horizontal=True 
    )
  st.write("Please enter all fields")
  name_input = st.text_input("Flight Number")

  submitted = st.form_submit_button("Submit")

try:
    name = int(name_input)

    if submitted:
        
        data = {
            "flight_id": name,
        }

        response = requests.delete(f"http://api:4000/flight_information/delete_flight/{name}", json=data)

        if response.status_code == 200:
            
            st.success("Flight successfully deleted!")
        else:
            st.error("Could not delete flight")

except Exception as e:
    st.write("Please enter a valid number")

