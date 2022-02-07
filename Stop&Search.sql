SELECT [Date]
      ,[Stop_Ref]
      ,[Time]
      ,[Borough_of_Stop]
      ,[Subject]
      ,SUBSTRING([Reason_for_Stop], 2, 100) AS Reason_for_Stop
      ,SUBSTRING([Outcome], 2,100) AS Outcome
      ,[Outcome_Reason]
      ,[Apparent_Age]
      ,[Gender]
      ,SUBSTRING([EA_Group], 1, 100) AS Appearance_Group
      ,SUBSTRING([SDE_Group], 1,100) AS Self_Defined_Group
  FROM [Stop_and_Search].[dbo].[SSData]