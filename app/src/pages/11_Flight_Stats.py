import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests
import pandas as pd
import plotly.express as px
from datetime import datetime
import altair as alt


st.set_page_config(layout = 'wide')

SideBarLinks()

# Person 2: Airline Manager, User Stories 1 - 5

st.title('Flight Statistics')
airline_manager_input = st.text_input("Enter the Airline ID:", key="AirlineId")

if st.button("Submit"):
    if not airline_manager_input.isdigit():
        st.warning("Please enter a valid numeric Airline ID")
    else:
        airline_id = int(airline_manager_input)

    try:
        response = requests.get(f"http://api:4000/fs/flights/{airline_id}/occupancyRate")

        if response.status_code == 200:
            data = response.json()

            if data:
                st.subheader("Occupancy Rate Chart")

                departure_dates = []
                occupancy_rates = []
                for item in data:
                    departure_dates.append(item['DepartureDate'])
                    occupancy_rates.append(item['OccupancyPercentage'])

                df = pd.DataFrame({
                    'Departure Date': departure_dates,
                    'Occupancy Rate': occupancy_rates
                })

                chart = alt.Chart(df.reset_index()).mark_bar().encode(
                    alt.X('Occupancy Rate:Q'),
                    alt.Y('Departure Date:N')
                ).properties(
                    width=600,
                    height=400,
                    title = f"Occupancy Rate By Date for Airline #{airline_id}"
                ).interactive()

                st.altair_chart(chart)

                
        else:
            st.warning("No occupancy rate data found for this airline.")
    except Exception as e:
        st.error("Unable to find occupancy rate. Try Again")

    try:
        delays_request = requests.get(f"http://api:4000/fs/flightDelays/{airline_id}")
        if delays_request.status_code == 200:
            delay_data = delays_request.json()
            delay_reason = []
            delay_count = []
            
            if delay_data:
                st.write("### Most Common Reasons for Flight Delays for Your Airline")
                table_data = [(k, int(v)) for k, v in delay_data[0].items()]
                df = pd.DataFrame(table_data, columns=["Reason", "Count"])
                df.sort_values(by="Count", ascending=False, inplace=True)
                st.dataframe(df.reset_index(drop=True), hide_index=True)
            else:
                st.warning("No delay data returned.")
        else:
            st.warning("No delay data found for this airline.")
    except Exception as e:
        st.error("Unable to connect")

