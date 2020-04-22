### Table 

It is important to sometimes serparate out a column from the dataset/dataframe and view its contents separately.

    table(dataset$fieldColumn,useNA="if any")           # To view one single column
    table(dataset$field1,dataset$field2)                # To compare the relation between two columns 
