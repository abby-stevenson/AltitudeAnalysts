import streamlit as st
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# About this App")

st.markdown (
    """
    We are building an app that streamlines flight logistics for travel agents, passengers, airline managers, and airport managers. 

Our data-driven approach to this solution will benefit these entities by allowing for a more personalized experience for users; 
both travel agents and passengers will be able to filter flights based on prices and locations. This will also help improve efficiency
 because all of the flight information, including departure times, arrival times, and prices, will all be in one place. The pain point
   we are addressing is mainly airports and passengers have to communicate with each airline separately. Since passengers don’t 
   constantly fly with the same airline and the airports have to communicate with all the airlines flying from and to the airport; 
   it can be time consuming and tiresome for them. Our app will collect, store and analyze all the data in one place making the 
   process more efficient and easier for passengers, airports and airlines.

Our app will provide airline and airport managers abilities to see graphs and statistics on the flights from their airline and leaving
 their airport respectively. It will also provide the functionality for passengers to see the status of their flight and information 
 pertaining to their airport experience. Finally it will give the airline manager the ability to add and remove flights that they are 
 operating. 


    """
        )
