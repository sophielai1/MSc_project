
# Comparing Air Quality and Associated Effects in Chinese Rural Villages from a Coal-to-Electricity Policy Intervention

## MSc Research Project

----------------------------------------------------------------------------

## Contents
**1. Project Background**  
1.1 Air Pollution in China  
1.2 PM<sub>2.5</sub>  
1.3 Salt Substitute and Stroke Study (SSaSS)   
1.4 Coal-to-Electricity Policy  
1.5 Previous Research  

**2. Aims and Objectives**  

**3. Methods and Script Definitions**  
3.1 PM<sub>2.5</sub> Data Source  
3.2 Data Pre-Processing 
3.3 Descriptive Analysis
3.4 Trend Analysis
3.5 Difference in Differences (DID) Test

**4. Results**  

**5. Discussion**  
5.1 Limitations
5.2 Implications for Future Research

----------------------------------------------------------------------------

## 1. Project Background

### 1.1 Air Pollution in China

Air pollution is fast becoming a major challenge faced by society, integrated in our daily lives, and is a considerable concern in public health and influencing government policies across the globe. A large proportion of energy consumed in China is through coal combustion, which is a large contributor to high levels of air pollution and many households in China use coal combustion for household heating.

### 1.2 PM<sub>2.5</sub>

The air pollutant investigated in this study is PM<sub>2.5</sub>, defined as fine particulate matter with an aerodynamic diameter smaller than 2.5μm. It has been classified as carcinogenic and increased levels have been associated with decreased life expectancy. Additionally, it has been shown to be a risk factor for stroke, which is the leading cause of death in China.

The 24 hour average limits for PM<sub>2.5</sub> are as follows:  
World Health Organisation: 15μg/m<sup>3</sup>  
Chinese government: 75μg/m<sup>3</sup>  

### 1.3 Salt Substitute and Stroke Study (SSaSS)

The Salt Substitute and Stroke Study (SSaSS) is a randomised controlled trial being conducted in China. Half of just under 21,000 participants are given a reduced sodium, added potassium salt substitute intervention while the other half continue with usual care. The participants are from 5 different provinces in China: Hebei, Liaoning, Shanxi, Shaanxi and the Ningxia autonomous region which is equivalent to province level. Within each province, 2 counties were selected and within each county, approximately 60 villages were selected for the SSaSS study. These areas were chosen based on having a high prevalence of hypertension and stroke, willingness to participate and being representative socioeconomically of the province. The study sites can be seen below.
![Study sites](/3_results/1_study_sites.png)

### 1.4 Coal-to-Electricity Policy

The coal-to-electricity policy was introduced in China in 2017 in order to decrease rising PM<sub>2.5</sub> concentrations. The policy aimed to replace coal combustion for heating in households with four main types of machines, all of which used electricity. This policy was funded by the government and households benefitted from reduced costs and maintenance of the machines as well as financial incentives.

### 1.5 Previous Research

Extensive research has been conducted into air pollution in China and pollutant concentration levels are being closely monitored. Many of these studies lack fine temporal and spatial resolution by using annual PM<sub>2.5</sub> data or focussing on a wide spatial location, such as provinces or cities. Additionally, there are a limited number of studies that focus on rural areas in China due to the fact that urban areas have better air pollution monitoring coverage. Studies in urban areas often have more political and scientific attention than those in rural areas and this can have an effect on funding provided to rural areas and therefore environmental policies implemented. This study will use a modelling dataset at a fine temporal and spatial resolution in order to explore PM<sub>2.5</sub> concentrations in rural areas in China.

----------------------------------------------------------------------------

## 2. Aims and Objectives

This study will use the study sites from the SSaSS study as a starting point. Across these study sites, I will:
- Create PM<sub>2.5</sub> datasets at village, county and province level  
- Explore the spatial differences of PM<sub>2.5</sub> at village level  
- Investigate PM<sub>2.5</sub> trends at county and province level  
- Quantify the effects of the coal-to-electricity policy on PM<sub>2.5</sub> concentrations  

----------------------------------------------------------------------------

## 3. Methods and Script Definitions

### 3.1 PM<sub>2.5</sub> Data Source

The data was from a database called [Tracking Air Polltuion in China (TAP)](http://tapdata.org.cn/?page_id=1160&item=pm25&lang=en). Daily temporal resolution and 1km x 1km spatial resolution were selected as they were the smallest resolutions available and the spatial resolution of the data matches that of the Chinese villages in the study. Data was downloaded for the dates between the 1<sup>st</sup> of January 2015 and 31<sup>st</sup> of December 2020 inclusive. It was extracted from a map of China with a fishnet grid where each cell was referred to as a tile with a tileID and each tile spanned 3 degrees of longitude and latitude. Each tile consisted of approximately 130,000 1km grids which have unique gridIDs. Data was downloaded as one csv file for each day and each tile. The year, day number and tileID were included in the filename only. 

### 3.2 Data Pre-Processing

The 1_data_preprocessing directory contains the following scripts.

*1_dataset_combine.R*: Extracting the year and day from each file name and putting them within each csv file. Then combining the csv files for all days in each year separately. Then combining the rds files for 2015 and 2016, 2017 and 2018, and 2019 and 2020 to make 3 rds files. 3 files were created rather than 1 as the file sizes were too large to handle. These datasets contain PM<sub>2.5</sub> concentrations, GridIDs, year and day.

*2_merge_tiles.R*: Doing a left join on GridID from each of the 3 PM<sub>2.5</sub> datasets created above and the tile data which includes GridIDs, TileIDs and the longitude and latitude of the centre of each grid. These datasets now contain PM<sub>2.5</sub> concentrations, GridID, year, day, TileID, longitude and latitude.

*3_convert_day_to_date.R*: Use the extracted year and day columns to create a date column in yyyy-mm-dd format. These final datasets now contain PM<sub>2.5</sub> concentrations, GridID, year, day, TileID, longitude, latitude and date.

*4_subset_province.R*: Subset the datasets into provinces using GridIDs and create a sample of 1000 rows of each dataset to test future code on. Further subsets the province data by intersecting with the province shapefiles to create a smaller, more accurate province-level dataset to work with later. The final province datasets will include all PM<sub>2.5</sub> measurements within the 120 villages from each province selected for the study, these are created in a later stage.

*5_create_village_level_datasets.R*: Use a csv file of the names of villages (approximately 60 per county) selected from each province and county for the study to extract the shapefile polygon of the same village name and intersect it with the PM2.5 data. This creates a dataset for each of the 600 villages in the study. The PM2.5 data was first subset from province into county so it would be easier to work with and to avoid villages of the same name but in a different county being selected. Challenges faced in this step: Village names for each county were checked for duplicates and in the case of duplicates, village locations were checked visually by plotting them and the village closest to the coordinates found on Google maps was selected. Some villages had no PM<sub>2.5</sub> data associated with them (a total of 8 villages). Some villages did not have a corresponding village polygon of the same name in the shapefiles (a total of 14 villages). This left a total of 578 villages with PM<sub>2.5</sub> data associated with them. Reasons for this could include language factors, such as there being traditional and simplified Chinese characters, local dialects, some villages having very similar names, people from different areas of China may refer to the same village by different names and administrative boundaries as well as the names of the areas may change.

*6_create_county_level_datasets.R*: Combine all village-level data for villages within each county. Aggregate the data by taking the daily and weekly mean PM<sub>2.5</sub> across all villages in each county. These datasets are saved in the *Aggregated_data/county_level* directory.

*7_create_province_level_datasets.R*: Combine all village-level data for villages within each province. Aggregate the data by taking the daily and weekly mean PM<sub>2.5</sub> across all villages in each province. These datasets are saved in the *Aggregated_data/province_level* directory.

### 3.3 Descriptive Analysis

The 2_analysis directory contains the following scripts.

*1_descriptive_study_sites.R*: Uses publicly available shapefiles of China at province and county level to show the study sites. Output: *3_results/1_study_sites.png*.

*2_descriptive_openair_plots.R*: Uses functions from the openair package to create descriptive plots from the aggregated county and province level datasets. Output: *3_results/2_county_level_timePlot_weekly.pdf, 2_province_level_timePlot_weekly.pdf*.

*3_descriptive_village_map_panel.R*: Creates map plots at village-level for each county showing mean PM<sub>2.5</sub> concentrations per day. The datasets for this plot are saved in the *Aggregated_data/village_level* directory. Output: *3_results/3_village_map_panel_complete.png*. 

*4_gganimate_village_level.R*: Creates map plot animations at village-level for each county showing mean PM<sub>2.5</sub> concentrations per day. Output: *3_results/ 'all files starting with 4_'*.

### 3.4 Trend Analysis

The 2_analysis directory contains the following scripts.

*5_trend_analysis.R*: SmoothTrend function from the openair package to visually assess PM<sub>2.5</sub> trends and 95% confidence intervals. TheilSen function from the openair package to calculate Theil-Sen estimates of the PM<sub>2.5</sub> trends. Analysis was repeated where data was deseasoned to show the effect of seasons on the trends. Output: *3_results/ 'all files starting with 5_'*.

### 3.5 Difference in Differences (DID) Test

The 2_analysis directory contains the following scripts.

*6_DID_test.R*: A DID test was conducted in order to determine whether the coal-to-electricity policy changed PM<sub>2.5</sub> concentrations significantly after implementation. From a given list of self-collected policy implementation dates for each village, most of the policy implementation status' were unknown. Only the Shaanxi province had enough villages for the tests. A total of 4 DID tests were done for each year the policy was implemented: 22 villages had the policy implemented in 2017, 4 villages had the policy implemented in 2018, 22 villages had the policy implemented in 2019 and 4 villages had the policy implemented in 2020. There were 15 villages in which the policy was confirmed as not being implemented across all years so these were used as the control in the DID tests. Output: *3_results/6_DID_test_results_table.png*.

----------------------------------------------------------------------------

## 4. Results

Figures and results are within the 3_results directory. 

- This daily, 1km by 1km dataset is able to demonstrate heterogeneity in PM<sub>2.5</sub> concentrations at village level.
![Village map panel](/3_results/3_village_map_panel_complete.png)
![Hebei Anguo animation](/3_results/4_hebei_anguo_2015_2020.gif)

- Winter has the highest PM<sub>2.5</sub> concentrations.
![Province timePlot](/3_results/2_province_level_timePlot_weekly.png)

- PM<sub>2.5</sub> trends have been decreasing across all provinces from 2015 to 2020.
![Province smoothTrends](/3_results/5_province_level_smoothTrend_monthly.png)

- The rates of decrease in the provinces range from -6.84 to -9.24 μg/<sup>m</sup> % every year from 2015 to 2020 and are statistically significant in every province and county.
![TheilSen results](/3_results/5_TheilSen_results_table.png)

- The coal-to-electricity policy did not appear to have a statistically significant effect on PM<sub>2.5</sub> concentrations.
![DID test results](/3_results/6_DID_test_results_table.png)

----------------------------------------------------------------------------

## 5. Discussion

### 5.1 Limitations  
- Lag effects from other major air pollution policies introduced prior to the coal-to-electricity policy  
- Lack of precision in coal-to-electricity policy implementation dates: these were given as a year but the exact date of implementation was unknown and it may take some time for the policy to be fully implemented  
- Bias in policy implementation status for villages: the status of the policy implementation was unknown for most villages. Local governments may have different reasons for publishing the policy implementation status.  
- Small sample sizes for the DID tests  
- Possible misclassification of village names  
- Data limitations: the PM<sub>2.5</sub> concentrations are predicted - there are fewer monitoring stations in rural areas which may affect the predicted concentrations in rural areas. The effects of the COVID-19 pandemic were not taken into account in the PM<sub>2.5</sub> concentration predictions.  

### 5.2 Implications for Future Research
- Gaining insights into air pollution in rural areas in China, where there is currently limited research   
- Can be used with health data (e.g. stroke data) to investigate the association between PM<sub>2.5</sub> exposure and disease incidence. As a result of the fine resolution of data used, daily temporal resolution and 1km by 1km spatial resolution, there should be minimal exposure misclassification.




