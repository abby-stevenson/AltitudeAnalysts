import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

# Display the appropriate sidebar links for the role of the logged in user
SideBarLinks()

# Person 1, User Story 2
# As a travel agent, I want to view a list of flights that my customers 
# have booked onto so that I can manage their itineraries effectively.

st.title('Flights Customers Have Booked')

passenger_id_input = st.text_input("Enter the Passenger ID of the customer you want to check:")
if st.button("Get Booked Flights"):
    if not passenger_id_input.isdigit():
       st.warning("Please enter a valid numeric Passenger ID.")
    else:
       passenger_id = int(passenger_id_input)
    try:
       response = requests.get(f"http://api:4000/pm/flight_information/{passenger_id}")


       if response.status_code == 200:
          data = response.json()
          if data:
             flight_nums = [data['FlightNumber'] for item in data]
             st.header(f"Passenger #{passenger_id} has the following flights booked:")
             for num in flight_nums:
                st.write(f"Flight Number: {num}")

                try:
                   
             
