CREATE TABLE C##dev.T1
(
    id NUMBER NOT NULL,
    t3_id NUMBER,
    CONSTRAINT t1_id_pk PRIMARY KEY (id)
);

CREATE TABLE C##dev.T2
(
    id NUMBER NOT NULL,
    t1_id NUMBER,
    CONSTRAINT t2_id_pk PRIMARY KEY (id)
);

CREATE TABLE C##dev.T3
(
    id NUMBER NOT NULL,
    t2_id NUMBER,
    CONSTRAINT t3_id_pk PRIMARY KEY (id)
);

ALTER TABLE C##dev.T3 DROP CONSTRAINT fk_t3_t2;
ALTER TABLE C##dev.T1 DROP CONSTRAINT fk_t1_t3;
ALTER TABLE C##dev.T2 DROP CONSTRAINT fk_t2_t1;

DROP TABLE C##dev.T3;
DROP TABLE C##dev.T2;
DROP TABLE C##dev.T1;



ALTER TABLE C##dev.T1 ADD CONSTRAINT fk_t1_t3 FOREIGN KEY (t3_id) REFERENCES C##dev.T3 (id);

ALTER TABLE C##dev.T3 ADD CONSTRAINT fk_t3_t2 FOREIGN KEY (t2_id) REFERENCES C##dev.T2 (id);
    
    
--циклическая зависимость

ALTER TABLE C##dev.T2 ADD CONSTRAINT fk_t2_t1 FOREIGN KEY (t1_id) REFERENCES C##dev.T1 (id);

