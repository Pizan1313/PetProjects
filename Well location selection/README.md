# Well location selection

It is necessary to decide where to drill a new well for the production company

We were provided with oil samples in three regions: in each - 10,000 fields, where we measured the quality of oil and the volume of its reserves. A machine learning model must be built to help determine the region where mining will bring the most significant profit. Analysis of possible gains and risks should be done using the *Bootstrap.* technique.

Steps to choose a location:

- In the selected region, a deposit is searched, and for each, the values of the features are determined;
- Building a model and assessing the volume of reserves;
- Search for the deposit with the highest value score. The number of fields depends on the company's budget and the cost of developing one well;
- The profit is equal to the total profit of the selected deposits.
