import requests
import streamlit as st
from modules.nav import SideBarLinks

SideBarLinks()

st.title("Airport Business Management")

st.subheader("Add a New Business")

with st.form("add_business_form"):
    add_id = st.text_input("Business ID")
    add_name = st.text_input("Business Name")
    add_type = st.text_input("Business Type")
    airport_code = st.text_input("Airport Code")

    if st.form_submit_button("Add Business"):
        if add_id and add_name and add_type and airport_code:
            try:
                response = requests.post(
                    f"http://api:4000/z/airport/{airport_code}/add-business",
                    json={"Id": add_id, "Name": add_name, "Type": add_type}
                )
                if response.status_code == 200:
                    st.success("Business successfully added!")
                else:
                    st.error("Error. Could not add business.")
            except:
                st.error("Unable to add business. Please try again.")
        else:
            st.warning("Please fill in all fields.")

st.subheader("Delete a Business")

with st.form("delete_business_form"):
    business_id = st.text_input("Business ID")

    if st.form_submit_button("Delete Business"):
        if business_id:
            try:
                response = requests.delete(f"http://api:4000/z/airport/{business_id}/delete-business")
                if response.status_code == 200:
                    st.success("Business deleted successfully!")
                else:
                    st.warning("Error. Could not delete business.")
            except:
                st.error("Unable to delete business. Please try again.")
        else:
            st.warning("Please enter a Business ID.")