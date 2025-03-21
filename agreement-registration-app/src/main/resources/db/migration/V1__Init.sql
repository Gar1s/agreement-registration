CREATE TABLE agreements
(
    id                     BIGSERIAL PRIMARY KEY,
    numeration             VARCHAR(200) NOT NULL,
    basis                  VARCHAR(120) NOT NULL,
    practice_type          VARCHAR(200) NOT NULL,
    agreement_date         DATE         NOT NULL,
    company_agreement_date DATE         NOT NULL,
    start_date             DATE         NOT NULL,
    end_date               DATE         NOT NULL,
    student_initials       VARCHAR(255) NOT NULL,
    year                   INTEGER      NOT NULL,
    speciality             VARCHAR(255) NOT NULL,
    company_id             BIGINT       NOT NULL
);

CREATE TABLE files
(
    id           VARCHAR(350) PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    type         VARCHAR(255) NOT NULL,
    agreement_id BIGINT       NOT NULL
);

CREATE TABLE companies
(
    id       BIGSERIAL PRIMARY KEY,
    name     VARCHAR(255) NOT NULL,
    basis    VARCHAR(120) NOT NULL,
    position VARCHAR(100) NOT NULL,
    initials VARCHAR(255) NOT NULL,
    city     VARCHAR(100) NOT NULL,
    street   VARCHAR(100) NOT NULL,
    index    VARCHAR(70)  NOT NULL
);

ALTER TABLE
    agreements
    ADD CONSTRAINT agreements_company_id_foreign FOREIGN KEY (company_id) REFERENCES companies (id);
ALTER TABLE
    files
    ADD CONSTRAINT files_agreement_id_foreign FOREIGN KEY (agreement_id) REFERENCES agreements (id);