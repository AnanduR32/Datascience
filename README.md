# Data Science

## Datascience Analysis Categories 
* ### Descriptive analysis

    When it is only necessary to describe the data without drawing any conclusion or relation between the variables. Descriptive analysis will generate simple summaries about the samples and their measurements. Some common descriptives statistics are measures of central tendency (eg: mean, median, mode) or measures of variability (eg: range, standard deviations or variance).
    
* ### Exploratory analysis

    We look at relations and obtain new findings and correlation between objects. But always remember the rule of thumb "Correlation does not imply causation", which implores that it is not necessary that just because there is a correlation one is not the cause of the other. Using exploratory analysis we find useful relations that were previously not known to us. 
    
* ### Inferential analysis 

    We observe how the analysis drawn from a sample group is related or similar to the population as a whole. Inferential analysis is commonly the goal of statistical modelling, where you have a small amount of information to extrapolate and generalize that information to a larger group.
    
* ### Predictive analysis 

    In predictive analysis we look at the data at hand and try make predictions about future data. The accuracy of the predictions is depended on measuring the right variables.

* ### Causal analysis

   the goal of causal analysis is to see what happens to one variable when we manipulate another variable - looking at the cause and effect of a relationship. Causal analyses are applied to the results of randomized studies that were designed to identify causation

* ### Mechanistic analysis

  It is a rather uncommon technique mostly applied in field of material science experiments, where there is deterministic outcome that can be analysed by modelling a deterministic equation and feeding it the right data. 
  
## Experimental Analysis 
* ### The main preliminary steps involved in experimental analysis are :

  * formulation of question
  * Designing of experiment
  * Identification of problems and sources of errors 
  * Collecting data

* ### Principles of experimental analysis:

  * #### Independent variable (factor):
  
      The data that is manipulated to obtain the desired measurement, and inpdepentent of other parameters 
      
  * #### Dependent variable:
      
      The measurement that is to be obtained as a result of analyzing the independent data
   
  * #### Hypothesis:
  
      The formed suggestion about a particular subject, or it can be considered as the expected outcome of the experiment that is being performed, the primary aspect of any data science analysis is to prove whether a hypothesis is true or not.
      
  * #### Cofounder: 
  
      An extraneous variable that may affect the relationship between the dependent and independent variables. When a correlation is found between independent variables and dependent variable it is important to be on the lookout for any cofounders that might be the actual variable missed out from the experiment that *cofounds* the findings your experiment and is the actual *cause* for the observed outcome. Often we use **Control** set to monitor the experiment the control and the experimentation set have different parameters to observe the effect of different variable on the outcome. This helps to identify cofounders and eliminate unnecessary variables. 
      
  * #### Randomization:
  
      The "balancing" of confounders is achieved by randomization, it is often seen in the random assignment of sample objects to control group and the experimentation group.
      
  * #### Replication: 
  
      The repetition of the experiment a number of times to arrive at a similar outcomes signifies that the model developed and the outcome obtained is strong. It helps to measure the **variability** within the experiment.
  
  * #### p-value :
  
      It is the measure of the strength of the evidence against the null hypothesis provided by the sample data. This is a value that tells you the probability that the results of your experiment were observed by chance, i.e. It is a probability that is calculated on the pretext that the null hypothesis is true, therefore a very low value suggest a strong statistical model.
  
## Data Quality Dimensions 
* Completeness 
* Validity 
* Accuracy
* Consistency 
* Integrity
* Timeliness 

## Metric

A good metric should have the following characteristics:
* Accurate
    It should go without saying that metrics should be accurate. Remember how, in the last mission ,we abandoned the estimation of the impact of the project because we couldn't properly measure it? By the same token, if a concept can't be adequately measured, then it shouldn't be a metric.  

* Simple and intelligible
    Metrics are meant to be read and understood at a glance. Metrics are often presented in the context of a dashboard or report containing other metrics. There is much to read and understand, so it should be easy to read each of the dashboard's components. Think of metrics as the headline to a story.  
    Because metrics are often divulged to broad audiences, they should be targeted to a common denominator.  

* Easy to drill down into

    Metrics are meant to monitor how a business is doing. Sometimes they will reveal that something is going exceptionally well, or exceptionally bad. In either case we will be interested in knowing what factors contributed to the change in the metric. In other words, metrics are headlines, you need to be able to read the story.  
    Since metrics typically are comprised of components (for example, profits can be seen has having two components: revenue and costs), we need to be able to drill down into them to understand what the change is attributed to.  

* Actionable
    The point of measuring the health of the business is not just so we know if things are going well or not. The goal is to act on things if they're not going in the direction we want. For this reason, a good metric needs to be actionable.  
    For example, it's known that weather has an impact on sales in brick-and-mortar stores, but we can't change the weather. A better option — and one we can act on — would be to measure the relevancy of our products based on the weather.  

* Dynamic
    Metrics need to be dynamic, they need to change over time. This characteristic is somewhat related to the above, but merits some distinction.  
    Many companies rent their offices instead of buying them. How much companies pay on leases is something that can potentially be acted on, in this sense it is actionable. However, since leases are legal contracts with relatively extended periods of time, this metric shouldn't be tracked — it's not dynamic enough.  

* Standardized
    The broader the reach of a metric (in terms of its audience), the more the metric's elementary components need to be standardized, so that everyone sees the same thing. Not doing this causes inconsistency and misinformation, potentially resulting in unwanted outcomes.   

* To give a couple of examples:
    Should Amazon count a sale as such the moment the customer places the order? When the payment goes through? When the order leaves the warehouse? When it is delivered? Even something as simple as the concept of sale can be ambiguous.  
    In supply chain management, lead time is defined as "the amount of time that passes from the start of a process until its conclusion."  
    Piggybacking from the previous example, should the lead time go up to the point where the order leaves the warehouse or until the customer receives it? Given that Amazon outsources the deliveries to companies like UPS, they don't have much control over what happens once the order is "on the road." However, from a customer satisfaction perspective, how long a customer takes to receive the order is definitely very relevant.  
    Conflicting definitions should be resolved when a metric is monitored by many people in the company.  

* Business oriented

    A metric should be relevant for the business. Here at Dataquest, we could potentially track how many times students use the character a in their answers. But it's unlikely to have any impact on how well they learn.  
    Metrics need to be adjusted to the current needs of the business. Take, for instance, Netflix. They possibly tracked how much business they were losing to piracy. When streaming became easily available and relatively cheap, piracy stopped being a serious issue and there (possibly) was no need to track it anymore.  
