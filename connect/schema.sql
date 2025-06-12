CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE schools (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "location" TEXT,
    "founded_year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE companies (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE people_connections (
    "user_A_id" INTEGER,
    "user_B_id" INTEGER
);

CREATE TABLE school_connections (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "status" TEXT CHECK ("status" IN ('earned', 'pursued')),
    "type_of_degree" TEXT,
    FOREIGN KEY ("user_id") REFERENCES users("id"),
    FOREIGN KEY ("school_id") REFERENCES schools("id")
);

CREATE TABLE company_connections (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "title" TEXT,
    FOREIGN KEY ("user_id") REFERENCES users("id"),
    FOREIGN KEY ("company_id") REFERENCES companies("id")
);


