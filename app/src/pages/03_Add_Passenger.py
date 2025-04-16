import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from modules.nav import SideBarLinks
import datetime

SideBarLinks()

st.write("# Add a passenger")

with st.form("add_change_form"):
  st.write("Please enter all fields")
  first_name = st.text_input("First Name")
  last_name = st.text_input("Last Name")
  birthday = st.date_input("Date of Birth", datetime.date.today(), "1900-01-01", "today")
  email = st.text_input("Email Address")
  passenger_id = st.text_input("Passenger ID")
  agent_id = st.text_input("Please enter your travel agent ID")

  submitted = st.form_submit_button("Submit")

  if submitted:
    all_checks = True
    
    if not "@" in email or not "." in email:
        st.warning('Please enter a valid email')
        all_checks = False
    if any(char.isdigit() for char in first_name) or any(char.isdigit() for char in last_name):
       st.warning('Please enter non-numeric characters in names')
       all_checks = False
    if not passenger_id.isdigit():
       st.warning("Please enter a valid numeric passenger ID")
       all_checks = False
    if not agent_id.isdigit():
       st.warning("Please enter a valid numeric agent ID")
       all_checks = False

    if all_checks:
        data = {
            "FirstName": first_name,
            "LastName": last_name,
            "DOB": birthday.strftime("%Y-%m-%d"),
            "Email": email,
            "Id": int(passenger_id)
        }

        agentID = int(agent_id)

        try:

            response = requests.post(f"http://api:4000/pm/add_passenger/{agentID}/passenger", json=data)

            if response.status_code == 200:
                    
                st.success("Passenger successfully added!")
            else:
                st.error("Could not add passenger, check if Agent ID is valid or Passenger ID is already taken")

        except Exception as e:
            st.error(f"Error connecting. Try again later")
