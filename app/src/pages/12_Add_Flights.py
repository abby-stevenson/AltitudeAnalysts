import logging
logger = logging.getLogger(__name__)
import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks
import datetime

SideBarLinks()

st.write("# Add a Flight or Change Flight Information")

with st.form("add_change_form"):
  option = st.radio(
      "Choose an action:",
      ["Add a flight", "Change a flight"],
      horizontal=True 
    )
  st.write("Please enter all fields")
  name = st.text_input("Flight Number")
  arrival_time = st.time_input("Flight Arrival Time", datetime.time(12, 0))
  departure_time = st.time_input("Flight Departure Time", datetime.time(12, 0))
  departure_date = st.date_input("Flight Date", datetime.date.today())
  flight_time = st.text_input("Flight time in minutes")
  terminal = st.text_input("Departing Terminal")
  gate = st.text_input("Departing Gate")
  capacity = st.text_input("Flight Capacity")
  from_airport = st.text_input("Departure Airport e.g. MCO")
  to_airport = st.text_input("Arrival Airport e.g. BOS")
  price = st.text_input("The price of a seat")
  airline_id = st.text_input("Airline ID")
  airline_manager_id = st.text_input("Airline Manager ID")

  submitted = st.form_submit_button("Submit")

  if submitted:
      data = {
          "flight_id": name,
          "arrival_time": arrival_time.strftime("%H:%M:%S"),
          "departure_time": departure_time.strftime("%H:%M:%S"),
          "departure_date": departure_date.strftime("%Y-%m-%d"),
          "terminal": terminal,
          "gate": gate,
          "occupancy": int(capacity), 
          "price": int(price), 
          "flight_time": int(flight_time),
          "airline_manager_id": int(airline_manager_id), 
          "arrival_airport_code": to_airport,
          "departure_airport_code": from_airport,
          "status": 1,
          "airline_id": int(airline_id)
      }

      response = requests.post("http://api:4000/flight_information/addFlight", json=data)

      if response.status_code == 200:
          
          st.success("Flight successfully added!")
      else:
         st.error("Could not add flight")