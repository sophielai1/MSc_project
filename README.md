
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

**3. Methods**  
3.1 PM<sub>2.5</sub> Data Source  
3.2 Data Pre-Processing  

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

The Salt Substitute and Stroke Study (SSaSS) is a randomised controlled trial being conducted in China. Half of just under 21,000 participants are given a reduced sodium, added potassium salt substitute intervention while the other half continue with usual care. The participants are from 5 different provinces in China: Hebei, Liaoning, Shanxi, Shaanxi and the Ningxia autonomous region which is equivalent to province level. Within each province, 2 counties were selected and within each county, approximately 60 villages were selected for the SSaSS study. These areas were chosen based on having a high prevalence of hypertension and stroke, willingness to participate and being representative socioeconomically of the province. The study sites can be seen in Figure 1.

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

## 3. Methods

### 3.1 PM<sub>2.5</sub> Data Source

The data was from a database called [Tracking Air Polltuion in China (TAP)](http://tapdata.org.cn/?page_id=1160&item=pm25&lang=en). Daily temporal resolution and 1km x 1km spatial resolution were selected as they were the smallest resolutions available and the spatial resolution of the data matches that of the Chinese villages in the study. Data was downloaded for the dates between the 1<sup>st</sup> of January 2015 and 31<sup>st</sup> of December 2020 inclusive and was downloaded in csv format for all study sites year by year.
GRID ID AND TILE ID----------------

### 3.2 Data Pre-Processing

*1_dataset_combine.R*: Combining the csv files for all years separately. Then combining the rds files for 2015 and 2016, 2017 and 2018, and 2019 and 2020 to make 3 rds files. 3 files were created rather than 1 as the file sizes were too large to handle. These datasets contain PM<sub>2.5</sub> concentrations and GridIDs.

*2_merge_tiles.R*: Doing a left join on GridID from each of the 3 PM<sub>2.5</sub> datasets created above and the tile data which includes GridIDs, TileIDs and the longitude and latitude of the centre of each grid. These datasets now contain PM<sub>2.5</sub> concentrations, GridID, TileID, longitude and latitude.

### 

----------------------------------------------------------------------------







