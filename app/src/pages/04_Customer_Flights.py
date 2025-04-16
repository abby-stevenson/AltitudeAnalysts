import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()


st.title('Flights Customers Have Booked')
passenger_id = st.text_input("Enter Customer's Passenger ID:")

if st.button("Submit"):
    if not passenger_id.isdigit():
        st.warning("Please enter a valid numeric Passenger ID.")
    else:
        passenger_id = int(passenger_id)
    try:
        response = requests.get(f"http://api:4000/pm/flight_information/{passenger_id}")

        if response.status_code == 200:
            data = response.json()
            if data:
                st.subheader(f"Customer #{passenger_id} has the following flights booked:")

                for item in data:
                    
                    flight_number = item.get('FlightNumber')
                    arrival_airport_code = item.get('ArrivalAirportCode')
                    departure_airport_code = item.get('DepartureAirportCode')

                    
                    st.write(f"Flight Number: {flight_number}")
                    st.write(f"  - Departure Airport: {departure_airport_code}")
                    st.write(f"  - Arrival Airport: {arrival_airport_code}")
            else:
                 st.warning("No flights found for this passenger.")
    except Exception as e:
        st.error("Unable to find flights. Try Again")