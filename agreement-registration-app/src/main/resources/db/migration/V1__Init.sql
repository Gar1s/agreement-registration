CREATE TABLE agreements
(
    id                     BIGSERIAL PRIMARY KEY,
    basis                  VARCHAR(100) CHECK
        (
        basis IN ('STATUTE', 'COMMISSION')
        )                               NOT NULL,
    practice_type          VARCHAR(100)
        CHECK
            (
            practice_type IN ('STUDY', 'MANUFACTURE', 'TECHNOLOGICAL', 'PRE_DIPLOMA')
            )                           NOT NULL,
    agreement_date         DATE         NOT NULL,
    company_agreement_date DATE         NOT NULL,
    start_date             DATE         NOT NULL,
    end_date               DATE         NOT NULL,
    student_initials       VARCHAR(255) NOT NULL,
    year                   INTEGER      NOT NULL,
    speciality             VARCHAR(255) NOT NULL,
    company_id             BIGINT       NOT NULL,
    file_id                BIGINT       NOT NULL
);

CREATE TABLE files
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    data oid          NOT NULL
);

CREATE TABLE companies
(
    id       BIGSERIAL PRIMARY KEY,
    name     VARCHAR(255) NOT NULL,
    basis    VARCHAR(100) CHECK
        (
        basis IN ('STATUTE', 'ORDER', 'COMMISSION')
        )                 NOT NULL,
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
    agreements
    ADD CONSTRAINT agreements_file_id_foreign FOREIGN KEY (file_id) REFERENCES files (id);