CREATE TABLE Patient_Info(
Number VARCHAR(10) NOT NULL,
[Date] DATE NOT NULL,
Age INT NOT NULL,
Gender VARCHAR(2) NOT NULL,
[Reason for Activation] VARCHAR(30) NOT NULL,
[Time of Activation] VARCHAR(10) NOT NULL,
[Year] INT NOT NULL,
[30 Day Survival] INT NOT NULL)

CREATE TABLE RBC(
[Year] INT NOT NULL,
Number VARCHAR(10) NOT NULL,
[Issued (RBC)] INT NOT NULL,
[Transfused (RBC)] INT NOT NULL,
[Wasted (RBC)] INT NOT NULL)

CREATE TABLE FFP(
[Year] INT NOT NULL,
Number VARCHAR(10) NOT NULL,
[Issued (FFP)] INT NOT NULL,
[Transfused (FFP)] INT NOT NULL,
[Wasted (FFP)] INT NOT NULL)

CREATE TABLE Platelets(
[Year] INT NOT NULL,
Number VARCHAR(10) NOT NULL,
[Issued (Platelets)] INT NOT NULL,
[Transfused (Platelets)] INT NOT NULL,
[Wasted (Platelets)] INT NOT NULL)

CREATE TABLE RBC_Metrics(
[Year] INT NOT NULL,
[Total Issued (RBC)] INT NOT NULL,
[Total Transfused (RBC)] INT NOT NULL,
[Total Wasted (RBC)] INT NOT NULL)

CREATE TABLE FFP_Metrics(
[Year] INT NOT NULL,
[Total Issued (FFP)] INT NOT NULL,
[Total Transfused (FFP)] INT NOT NULL,
[Total Wasted (FFP)] INT NOT NULL)

CREATE TABLE Platelet_Metrics(
[Year] INT NOT NULL,
[Total Issued (Plts)] INT NOT NULL,
[Total Transfused (Plts)] INT NOT NULL,
[Total Wasted (Plts)] INT NOT NULL)

CREATE TABLE Survival_Rate(
[Year] INT NOT NULL,
[30 Day Survival Rate] FLOAT NOT NULL)

CREATE TABLE Ratios(
[Year] INT NOT NULL,
RBC INT NOT NULL,
FFP INT NOT NULL,
Platelets INT NOT NULL)

ALTER TABLE Patient_Info
ADD CONSTRAINT PK_Patient_Info_Number PRIMARY KEY (Number)

ALTER TABLE RBC
ADD CONSTRAINT FK_RBC_Number FOREIGN KEY (Number) REFERENCES Patient_Info(Number)

ALTER TABLE FFP
ADD CONSTRAINT FK_FFP_Number FOREIGN KEY (Number) REFERENCES Patient_Info(Number)

ALTER TABLE Platelets
ADD CONSTRAINT FK_Platelets_Number FOREIGN KEY (Number) REFERENCES Patient_Info(Number)

ALTER TABLE RBC_Metrics
ADD CONSTRAINT PK_RBC_Metrics_Year PRIMARY KEY ([Year])

ALTER TABLE FFP_Metrics
ADD CONSTRAINT PK_FFP_Metrics_Year PRIMARY KEY ([Year])

ALTER TABLE Platelet_Metrics
ADD CONSTRAINT PK_Platelet_Metrics_Year PRIMARY KEY ([Year])

ALTER TABLE RBC
ADD CONSTRAINT FK_RBC_Year FOREIGN KEY ([Year]) REFERENCES RBC_Metrics([Year])

ALTER TABLE FFP
ADD CONSTRAINT FK_FFP_Year FOREIGN KEY ([Year]) REFERENCES FFP_Metrics([Year])

ALTER TABLE Platelets
ADD CONSTRAINT FK_Platelets_Year FOREIGN KEY ([Year]) REFERENCES Platelet_Metrics([Year])

ALTER TABLE Survival_Rate
ADD CONSTRAINT PK_Survival_Rate_Year PRIMARY KEY ([Year])

ALTER TABLE Patient_Info
ADD CONSTRAINT FK_Patient_Info_Survival FOREIGN KEY ([Year]) REFERENCES Survival_Rate([Year])

ALTER TABLE Ratios
ADD CONSTRAINT PK_Ratios_Year PRIMARY KEY ([Year])

ALTER TABLE Patient_Info
ADD CONSTRAINT FK_Patient_Info_Ratios FOREIGN KEY ([Year]) REFERENCES Ratios([Year])
