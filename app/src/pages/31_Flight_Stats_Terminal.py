import streamlit as st
st.set_page_config(layout = 'wide')
import logging
logger = logging.getLogger(__name__)
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks
from datetime import datetime

SideBarLinks()



st.write("# See All The Flights Departing From a Specific Terminal")

DepartureAirportCode_input = st.text_input("Enter the departing Airport Code:", key="DepartureAirportCode")
Terminal_input = st.text_input("Enter the departing terminal:", key="Terminal")

if st.button("Get Flights"):
    try:
        response = requests.get(f"http://api:4000/f/terminal/{DepartureAirportCode_input}/{Terminal_input}")
        data = response.json()
        if data:
            st.subheader(f"The following flights from Airport {DepartureAirportCode_input} , Terminal {Terminal_input}:")

            for item in data:
                flight_number = item.get('FlightNumber')
                departure_datetime = item.get('DepartureDateTime')
                terminal = item.get('Terminal')
                gate = item.get('Gate')
                arrival_airport = item.get('ArrivalAirportCode')
                status = item.get('Status')

                if departure_datetime:
                    dt = datetime.fromisoformat(departure_datetime)
                    departure_date = dt.strftime("%Y-%m-%d")
                    departure_time = dt.strftime("%H:%M:%S")
                else:
                    departure_date = "N/A"
                    departure_time = "N/A"

                st.write("Flight Number:", flight_number)
                st.write("Flight Scheduled for:", departure_date, "at", departure_time)
                st.write("Terminal:", terminal)
                st.write("Gate:", gate)
                st.write("Arrival Airport:", arrival_airport)
                if status == 1:
                    st.write("Status: On time") 
                else:
                    st.write("Status: On time") 
                st.write("---")
        else:
            st.write(f"No flight and/or terminal found")
    except Exception as e:
        st.warning(f"An unexpected error occurred: {e}")

