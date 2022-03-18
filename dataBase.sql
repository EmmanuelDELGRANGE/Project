#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Car
#------------------------------------------------------------

CREATE TABLE Car(
        numCar        Int  Auto_increment  NOT NULL ,
        model         Varchar (50) NOT NULL ,
        constructor   Varchar (50) NOT NULL ,
        rentPrice     Int NOT NULL ,
        discountOffer Float NOT NULL ,
        size          Varchar (50) NOT NULL
	,CONSTRAINT Car_PK PRIMARY KEY (numCar)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        numUser  Int  Auto_increment  NOT NULL ,
        name     Varchar (50) NOT NULL ,
        email    Varchar (50) NOT NULL ,
        password Varchar (50) NOT NULL ,
        type     Varchar (50) NOT NULL ,
        lastName Varchar (50) NOT NULL
	,CONSTRAINT User_PK PRIMARY KEY (numUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Rent
#------------------------------------------------------------

CREATE TABLE Rent(
        numRent  Int  Auto_increment  NOT NULL ,
        duration Int NOT NULL ,
        discount Float NOT NULL ,
        numUser  Int NOT NULL
	,CONSTRAINT Rent_PK PRIMARY KEY (numRent)

	,CONSTRAINT Rent_User_FK FOREIGN KEY (numUser) REFERENCES User(numUser)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: include
#------------------------------------------------------------

CREATE TABLE include(
        numRent Int NOT NULL ,
        numCar  Int NOT NULL
	,CONSTRAINT include_PK PRIMARY KEY (numRent,numCar)

	,CONSTRAINT include_Rent_FK FOREIGN KEY (numRent) REFERENCES Rent(numRent)
	,CONSTRAINT include_Car0_FK FOREIGN KEY (numCar) REFERENCES Car(numCar)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Modify
#------------------------------------------------------------

CREATE TABLE Modify(
        numUser Int NOT NULL ,
        numCar  Int NOT NULL
	,CONSTRAINT Modify_PK PRIMARY KEY (numUser,numCar)

	,CONSTRAINT Modify_User_FK FOREIGN KEY (numUser) REFERENCES User(numUser)
	,CONSTRAINT Modify_Car0_FK FOREIGN KEY (numCar) REFERENCES Car(numCar)
)ENGINE=InnoDB;

