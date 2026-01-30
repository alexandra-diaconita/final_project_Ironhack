# Analysis of Baccalaureate Exam Grades in Romania, 2018–2025



This project focuses on the analysis of Baccalaureate exam grades of students from 2018 to 2025, with particular attention to how the COVID-19 pandemic may have affected their performance and subsequent results. We began with the assumption that the pandemic would lead to a decline in student performance; however, this assumption was not confirmed.



## Table of Contents



#### 1\. Dataset

#### 2\. Methodology

#### 3\. Results/ Insights

#### 4\. Visualizations

#### 5\. Technologies Used

#### 6\. Used Guide

#### 7\. Limitations

#### 8\. Glossary

#### 9\. Sources

#### 10\. Links



### Dataset



The analysis is based on official Baccalaureate exam data for students in Romania from 2018 to 2025, obtained from [https://data.gov.ro/](https://data.gov.ro/) and [https://www.siiir.edu.ro/carto/](https://www.siiir.edu.ro/carto/). The dataset includes exam grades, student demographics, and school-level information.



This investigation can be used to examine students’ behaviour with regard to their participation in the baccalaureate examination (full or partial), the difficulties encountered in certain written exams that influence pass rates, and preferences in choosing the subject for the third paper. At the same time, it offers educators and those responsible for curriculum organization and management a broad perspective on how the pre-pandemic and post-pandemic periods have left their mark on the way future adults approach a fundamental question: Is the baccalaureate important to me?



The present interpretation is also of particular interest because, at the time it is conducted (January 2026), Romanian high schools host the final cohort of twelfth-grade students who experienced, although for only one year, the advantages and disadvantages brought about by the pandemic period. The results they obtain in the first and second examination sessions will be especially relevant for assessing post-pandemic pass rates among students who spent at least one year in remote education or in the process of readjusting to in-person learning.



### Methodology



Data cleaning: removing duplicates, handling missing values, and standardizing column names.

Aggregations: calculating averages, percentages, and counts to summarize student performance and participation.

Statistical tests: conducting hypothesis tests such as t-tests and computing effect sizes (Cohen’s d) to evaluate differences between groups.

Groupings: organizing the data by key variables such as year, gender, environment (urban/rural), and school to enable comparative analysis.

Data storage: storing and querying the student and school data using MySQL.

Visualization: creating interactive dashboards and charts using Tableau as well as Python libraries such as Plotly, Seaborn, and Matplotlib to explore trends and highlight insights.



### Results/ Insights



The Baccalaureate exam (Bacalaureat) in Romania is the national graduation exam taken at the end of upper secondary education (12th grade) and it certifies that a student has successfully completed high school. Passing the Bacalaureat is mandatory for enrolling in most universities, for certain public-sector jobs, and is widely regarded as a key indicator of academic achievement. The exam typically consists of three written tests: Romanian language and literature (compulsory), a second compulsory subject depending on the student’s educational profile (usually Mathematics or History), and an elective subject chosen according to specialization (such as Geography, Biology, Logic, etc.), along with assessments of Romanian language, modern language and digital competences.



For the current analysis, I chose the dataset starting from 2018 in order to have an overview of the evolution of the Baccalaureate pass rates before and after the pandemic period.



Between 2020 and 2023, the Romanian Ministry of Education implemented a series of measures to adapt the baccalaureate examination and student preparation to the challenges posed by the COVID-19 pandemic. These measures included the transition to online and hybrid learning, the adjustment of examination syllabi to cover only content taught prior to school closures, the introduction of strict health and safety protocols in examination centers, and the organization of special exam sessions for students affected by quarantine or illness. Simulations were suspended in 2020, administrative procedures were made more flexible, and additional guidance was provided to support schools and students. In 2023, further exceptional decisions were taken, such as the equivalation of oral and digital competency exams with students’ school grades and the extension of enrollment and completion deadlines, aiming to ensure fairness, accessibility, and continuity in the evaluation process while minimizing the negative educational impact of the pandemic.



From 2018 to 2025, Baccalaureate outcomes in Romania show a generally positive trend in both performance and participation, with notable variations during the COVID-19 pandemic (2020–2023). Overall, pass rates increased from 53.3% in 2018 to 66.4% in 2024 (74.3% in 2025), while failure rates declined from 33.9% to 27.4% (22.6% in 2025), and absenteeism dropped from 12.7% to 6.1% (3.0% in 2025). Categories such as Disqualified or Not Evaluated remained negligible, reflecting stable administrative procedures.



Pandemic-related disruptions are evident in 2020, when the number of students who completed the first exam but skipped subsequent ones peaked at over 16,000, and those missing the final elective exam rose to 10,413. From 2021 onward, these numbers declined and stabilized between 6,000-8,400 students, showing improved follow-through and exam participation. Average grades also reflect this pattern: the first compulsory exam rose from 5.99 in 2018 to 6.72 in 2024 (6.97 in 2025), the second from 5.29 to 6.54 (6.95 in 2025), and elective exams consistently scored slightly higher, reaching 6.97 in 2024 (7.54 in 2025).



Performance differences by environment and gender are consistent throughout the period. Students from urban areas generally outperform those from rural areas, and female students score higher than male students every year. The pandemic year 2022 saw a sharp drop in scores, particularly for males (7.37 → 5.13), yet the gender gap persisted, and scores recovered steadily from 2023 onward.



The year 2022 proved to be the most challenging pandemic year in terms of student performance. This outcome can be attributed to several factors: students had already spent two years under pandemic conditions, the attention deficits caused by prolonged online learning for some students, and a perceived lack of motivation and creativity among teachers, as reported by students in various interviews.



Regarding student preferences, elective subjects are highly concentrated, with Geography, Anatomy and Human Physiology, Genetics and Human Ecology, and Logic, Argumentation, and Communication dominating choices. Modern language selection is even more skewed, with English overwhelmingly preferred by over 1.16 million students, far ahead of French and German. Across most years, Evening enrollments (Seral) slightly exceed Part-time attendance (Frecvență redusă), indicating that evening classes remain a flexible option for students balancing school with other commitments.



Overall, the data highlights a clear positive trajectory in both participation and performance, while some pandemic years stand out for their temporary disruptions, especially in exam attendance and average scores, providing valuable insight into the resilience and adaptation of the education system.



### Visualizations



Line charts 

Choropleth



### Technologies Used



Python

Pandas 

NumPy 

Matplotlib 

Seaborn 

Plotly Express

Plotly Graph Objects

GeoPandas 

SciPy Stats 

JSON

Unidecode



### User Guide



Fork this repo

Clone it to your machine



##### How to run the project



###### 1\. Data Availability



This project does not include raw data in the repository.

To download the data, run the script: 'get\_raw\_data'

This will fetch the raw datasets and store them locally.



###### 2\. Data Processing \& Analysis



All processing steps are located in the notebooks/ folder. Run the notebooks in the following order: 'clean\_data'

Cleans the raw datasets by:

* Dropping irrelevant columns
* Renaming columns for consistency
* Keeping only the data required for analysis



'list\_of\_schools'

Generates a list of Romanian educational institutions that:

* Have a unique identification code
* Are grouped by region and county



'data\_concat'

Concatenates data from all available years;

Creates additional datasets aggregated by:

* *Regions*
* *Schools*



'analysis'

Performs exploratory and analytical processing to:

* Analyze trends and patterns
* Generate insights based on the processed data



'save\_data\_sql'

* Prepares the final datasets
* Exports the results to a SQL database



### Limitations



Due to the fact that the source website contained information for 2025 only for the first exam session, the analysis primarily focuses on 2024, and data for 2025 are included only in a limited or partial manner.



### Glossary



candidate\_unique\_code = a private, unique identifier assigned to each student enrolled in the exam.

specialization = the specific subjects studied depending on the student’s educational profile.

profile = the general educational track of the student, e.g., Real (Sciences), Uman (Humanities), Tehnic (Technical), Artistic (Arts), Militar (Military).

field\_of\_study = the type of educational pathway: Teoretică (Theoretical), Tehnologică (Technological), or Vocațională (Vocational).

form\_of\_education = the mode of attendance: Zi (day classes), Frecvență redusă (reduced frequency/part-time), or Seral (evening classes).

candidate\_environment = the student’s area of residence: urban or rural.

unit\_SIIIR = the unique identifier assigned to each school.

class\_year = the student’s year of study (12th grade).

core\_subject\_1/ subject\_ea = the first compulsory exam (Romanian language, written).

modern\_language = the foreign language in which the student feels most confident for the exam.

core\_subject\_2/ subject\_ec = the second compulsory exam (usually Mathematics or History).

elective\_subject/ subject\_ed = the third compulsory exam, chosen by the student.

graduation\_year = the year when the student completed 12th grade.

status\_a = the result of the Romanian language oral communication exam.

status\_b = the result of the Romanian language written production exam.

status\_c = the result of the foreign language competence exam.

status\_d / status\_digital= the result of the digital competence exam.

status\_subject\_1/ status\_ea = the status of the student for the first exam (passed, failed, absent, not evaluated or disqualified).

status\_subject\_2/ status\_ec = the status of the student for the second exam.

status\_elective\_subject/ status\_ed = the status of the student for the elective exam.

ita = listening comprehension in the foreign language exam.

written\_itc / written\_reading\_comprehension = reading comprehension level in the foreign language exam.

written\_pms / written\_production = writing skill level in the foreign language exam.

oral\_pmo / oral\_production = oral production level in the foreign language exam.

oral\_io / oral\_interaction = interactive speaking level in the foreign language exam.

digital\_score = score obtained in the digital competence exam.

status = official exam status: passed, failed, absent, disqualified, etc.

average = the average score of the three compulsory exams.

year = the calendar year of the exam session.

session = the exam session number (1 or 2).

final\_score\_subject\_1/ final\_score\_ea = final score of the first compulsory exam.

final\_score\_subject\_2/ final\_score\_ec = final score of the second compulsory exam.

final\_score\_elective\_subject/ final\_score\_ed = final score of the third compulsory exam.



### Sources



[https://data.gov.ro/](https://data.gov.ro/)

[https://www.siiir.edu.ro/carto/](https://www.siiir.edu.ro/carto/)



### Links:

[Tableau](https://public.tableau.com/views/final_project_dashboard_17696100852830/Dashboard1?:language=pt-BR&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Presentation](https://www.canva.com/design/DAG_yzlqefw/rptUOoidqSS1FQ_AtrZppQ/edit?utm_content=DAG_yzlqefw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

