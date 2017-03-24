# The project for the "Getting and cleaning data" course 
## Working with wearable computers dataset

The code for merging and modifying data is run_analisis.R.
In order to run it, you need to specify the folder where you have unzipped the data. 
The ordering of the steps for the assignment was slightly modified for convinience. The code does the following:
1. Reads the data from the specified folder;
2. Merges test data and train data;
3. Adds names to the columns of the data;
4. Changes numeric labels to descriptive ones in y\_ datasets;
5. Adds names to columns;
6. Selects only columns with mean and standard deviation data;
7. Adds subject data and activity labels to the dataset;
8. Calculates means of each variables for every subject / activity combination;
9. Writes the resulting dataset to txt file.

This repo contain the following files:
1. README - this file, describing the repo;
2. runAnalysis.R - code for analysing the given data;
2. activity_subject_means.txt - the dataset resulting after runAnalysis.R was applied to the given data;
3. Codebook.md - markdown file describing  the variables in the resulting dataset.
