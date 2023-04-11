# Steel melting temperature prediction

## Problem condition

In order to optimize production costs, the smelter decided to reduce electricity consumption during the steel processing stage. You have to build a model that predicts the temperature of the steel.




## Description of the processing step

Steel is processed in a metal ladle with a capacity of about 100 tons. For the ladle to withstand high temperatures, it is lined with refractory bricks from the inside. Molten steel is poured into a ladle and heated to the desired temperature with graphite electrodes. They are installed in the lid of the bucket.

Sulfur is removed from the alloy (desulfurization), the chemical composition is corrected by adding impurities, and samples are taken. Steel is alloyed - its composition is changed - by feeding pieces of alloy from a bulk materials bin or wire through a special tribe apparatus.

Before introducing alloying additives, the temperature of the steel is measured, and its chemical analysis is carried out. Then the temperature is raised for several minutes, alloying materials are added, and the alloy is purged with an inert gas. Then it is stirred and measured again. This cycle is repeated until the target chemical composition and optimum melting temperature are reached.

Then the molten steel is sent to finish the metal or enters the continuous casting machine. From there, the finished product comes out as slab blanks.

## Data Description

The data consists of files obtained from various sources:

<code>data_arc.csv</code> — electrode data;

<code>data_bulk.csv</code> - data on the supply of bulk materials (volume);

<code>data_bulk_time.csv</code> - data on the supply of bulk materials (time);

<code>data_gas.csv</code> — data on alloy gas purge;

<code>data_temp.csv</code> — temperature measurement results;

<code>data_wire.csv</code> — data on wire materials (volume);

<code>data_wire_time.csv</code> - data about wire materials (time).

The <code>key</code> column contains the batch number in all files. Several lines in files with the same <code>key</code> value can correspond to different processing iterations.

## Plan of work

<b>Explore data.</b>
- A deeper study of the physics of the process;
- Study each table;
- Visually display data;
- Estimate where anomalies may be and understand what they mean.

<b>Preprocessing.</b>
- Change data types;
- Process signs (omissions, abnormal values, if any);
- Determine the target feature;
- Create a single table;
- Determine the importance of each feature.

<b>Preparing features.</b>
- Separation into features and targets.

<b>Training and model selection.</b>
- train models;
- Assess the importance of features;
- Estimate MAE predictions. Compare with median prediction;
- Test successful models on a test set.

<b>Testing the model.</b>
- Test models. MAE must be less than 8.7;
- Determine the optimal model. MAE must be less than 6.

<b>Output.</b>
