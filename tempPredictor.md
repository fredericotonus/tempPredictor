### **Predicting temperature with tempPredictor**



This report describes tempPredictor, an interactive Shiny application that predicts temperature based on solar radiation and wind speed using linear regression models on the airquality dataset.





#### \# Executive summary



This application allows users to explore the relationship between temperature, solar radiation and wind speed. It fits linear regression models to the data and provides real-time temperature predictions based on user inputs about solar radiation and wind speed. Its reactivity enables users to automatically update the models and predictions based on their inputs.

All the data come from built-in R airquality dataset. There is a short data cleaning step that removes rows with missing solar radiation values. Temperature is always displayed in degrees Fahrenheit (°F).





#### \# Features



**Interactive sliders**: Adjust solar radiation in Langley units (Ly) and wind speed in miles per hour (mph)

**Month selection**: Analyze data for specific months (May-September) or all months combined

**Dynamic model fitting**: Linear regression models are recalculated based on the selected month

**Visual feedback**: Scatter plots with regression lines and prediction points

**Temperature predictions**: Real-time temperature forecasts from three different models





#### \# Interface Components



* ##### Sidebar Panel (Controls)



**Solar Radiation Slider**:	Set the solar radiation value for prediction (7 - 334 Ly)

**Show Solar Model**: Toggle the solar radiation regression line and prediction point (on/off)

**Wind Speed Slider**: Set the wind speed value for prediction (1 - 21 mph)

**Show Wind Model**: Toggle the wind speed regression line and prediction point (on/off)

**Month Selection**: Choose which month's data to analyze (May - September / All)

**Done Button**: Apply all changes and update outputs



* ##### Main Panel (Outputs)



###### Solar Radiation Section



Predicted temperature from solar radiation model

Scatterplot: Temperature vs Solar Radiation

Regression line (when enabled)

Current prediction point (when enabled)



###### Wind Speed Section



Predicted temperature from wind speed model

Scatterplot: Temperature vs Wind Speed

Regression line (when enabled)

Current prediction point (when enabled)



###### Combined Model Section



Predicted temperature using both variables simultaneously





#### \# Functionality



Select your input parameters using the sliders and radio buttons.

Toggle checkboxes to show/hide regression lines and prediction points.

Click "Done" to update all predictions and plots.

Observe predictions in real-time as you modify inputs.



The application fits three linear regression models:



**Solar Model**: Temperature ~ Solar Radiation

Shows how temperature increases with solar radiation



**Wind Model**: Temperature ~ Wind Speed

Shows how temperature decreases as wind speed increases



**Combined Model**: Temperature ~ Solar Radiation + Wind Speed

Uses both variables for more accurate predictions



**Important note**: All models are refitted using only the data from your selected month, providing month-specific insights.





#### \# References



Dataset: airquality (New York Air Quality Measurements)

Built with R Shiny

Linear regression models using base R lm() function

