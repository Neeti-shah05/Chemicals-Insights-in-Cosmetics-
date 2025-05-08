<h1> Chemical Insights in Cosmetics </h1>
<i> An Exploratory Data Analysis (EDA) Project in R: </i> This project is part of my coursework for ALY 6000 – Introduction to Analytics at Northeastern University. It explores chemical composition patterns across thousands of cosmetic products using a publicly available dataset from Data.gov.

<i> Objective: </i> To perform data cleaning and exploratory analysis on cosmetic product data to uncover trends in:
<ul>
    <li>Analyze brand and company chemical diversity</li>
    <li>Identify common product types and subcategories</li>
    <li>Determine frequently used cosmetic chemicals</li>
  </ul>
  
<h2>Dataset</h2>
  <ul>
    <li><strong>Source:</strong> California Safe Cosmetics Program Product Database – <a href="https://catalog.data.gov/dataset/chemicals-in-cosmetics-d55bf" target="_blank">Link</a></li>
    <li><strong>Records:</strong> ~114,000 rows</li>
    <li><strong>Attributes:</strong> Brand, Company, Chemical, Product Type, Subcategory, Date</li>
  </ul>

  <h2>🔧 Key Steps</h2>
  <ul>
    <li>Removed missing values and standardized brand names</li>
    <li>Randomly sampled 6,000 records using <code>sample_n()</code></li>
    <li>Used <code>dplyr</code> and <code>ggplot2</code> for EDA and visualization</li>
    <li>Plotted pie charts, bar charts, and year trends</li>
  </ul>

  <h2> Key Findings</h2>
  <ul>
    <li><strong>Sephora</strong> and <strong>L’Oréal</strong> appeared most frequently after brand standardization</li>
    <li><strong>Makeup Products (non-permanent)</strong> were the most common category</li>
    <li><strong>Titanium Dioxide</strong>, <strong>Mica</strong>, and <strong>Iron Oxides</strong> were top-used chemicals</li>
  </ul>
