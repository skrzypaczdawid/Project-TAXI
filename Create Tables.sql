CREATE TABLE auta (
    tablica_rejestracyjna   VARCHAR2(12 CHAR) NOT NULL,
    id_auta                 INTEGER NOT NULL,
    model                   VARCHAR2(40 CHAR),
    marka                   VARCHAR2(40 CHAR),
    przebieg                INTEGER,
    czy_wolne               CHAR(1)
);

ALTER TABLE auta ADD CONSTRAINT auta_pk PRIMARY KEY ( tablica_rejestracyjna );

CREATE TABLE kierowcy (
    nr_identyfikacyjny   INTEGER NOT NULL,
    id_auta              INTEGER NOT NULL
);

ALTER TABLE kierowcy ADD CONSTRAINT kierowcy_pk PRIMARY KEY ( id_auta );

CREATE TABLE klienci (
    id_klienta      INTEGER NOT NULL,
    nr_zamowienia   INTEGER NOT NULL,
    imie            VARCHAR2(25 CHAR),
    nazwisko        VARCHAR2(35 CHAR),
    nr_telefonu     INTEGER
);

ALTER TABLE klienci ADD CONSTRAINT klienci_pk PRIMARY KEY ( id_klienta );

CREATE TABLE pracownicy (
    nr_identyfikacyjny   INTEGER NOT NULL,
    imie                 VARCHAR2(25 CHAR),
    nazwisko             VARCHAR2(35 CHAR),
    nr_telefonu          INTEGER,
    e_mail               VARCHAR2(50 CHAR),
    data_zatrudnienia    DATE,
    stanowisko           VARCHAR2(40 CHAR)
);

ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_pk PRIMARY KEY ( nr_identyfikacyjny );

CREATE TABLE promocje (
    id_klienta       INTEGER NOT NULL,
    ilosc_zamowien   INTEGER NOT NULL,
    promocja         CHAR(1)
);

ALTER TABLE promocje ADD CONSTRAINT promocje_pk PRIMARY KEY ( id_klienta );

CREATE TABLE zamowienie (
    tablica_rejestracyjna   VARCHAR2(12 CHAR) NOT NULL,
    id_klienta              INTEGER NOT NULL,
    ilosc_kilometrow        INTEGER,
    cena                    INTEGER
);

ALTER TABLE auta
    ADD CONSTRAINT id_auta FOREIGN KEY ( id_auta )
        REFERENCES kierowcy ( id_auta );

ALTER TABLE promocje
    ADD CONSTRAINT id_klienta FOREIGN KEY ( id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE kierowcy
    ADD CONSTRAINT nr_identyfikacyjny FOREIGN KEY ( nr_identyfikacyjny )
        REFERENCES pracownicy ( nr_identyfikacyjny );

ALTER TABLE zamowienie
    ADD CONSTRAINT nr_zamowienia FOREIGN KEY ( id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE zamowienie
    ADD CONSTRAINT tablica_rejestracyjna FOREIGN KEY ( tablica_rejestracyjna )
        REFERENCES auta ( tablica_rejestracyjna );
        
        
        /
        
        select * from klienci