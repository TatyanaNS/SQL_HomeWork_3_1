-- create database "db_test"
--drop database db_test;
--create database db_test;

 --projects dictionary
create table projects(
	id 		     serial      not null,
	project_name varchar(50) not null,
	created		 date        not null,
	CONSTRAINT projects_pk PRIMARY KEY (id)
);

 --customers dictionary
create table customers(
	id 		      serial      not null,
	customer_name varchar(50) not null,
	CONSTRAINT customers_pk PRIMARY KEY (id)
);

 --companies dictionary
create table companies(
	id 		     serial       not null,
	company_name  varchar(50) not null,
	CONSTRAINT companies_pk PRIMARY KEY (id)
);

 --developers dictionary
create table developers(
	id 		      serial      not null,
	last_name     varchar(50) not null,
	first_name    varchar(50) not null,
	Surname       varchar(50),
	developer_age integer,
	date_of_birth   date,
	gender        varchar(50) not null,
	company_id    integer     not null,
	CONSTRAINT developers_pk PRIMARY KEY (id),
	CONSTRAINT fk_id_company FOREIGN KEY(company_id) REFERENCES companies(id)
);

 --skills table
create table skills(
	id 			 serial     not null,
	industry     varchar(50) not null,
	level_skills varchar(50) not null,
	CONSTRAINT skills_pk PRIMARY KEY (id)
);

-- developer_skill
create table developer_skill(
	developer_id integer not null,
	skill_id     integer not null,
	CONSTRAINT fk_developers_developer_id FOREIGN KEY(developer_id) REFERENCES developers(id),
	CONSTRAINT fk_skills_skill_id FOREIGN KEY(skill_id) REFERENCES skills(id)
);

-- developer_project
create table developer_project(
	developer_id integer not null,
	project_id   integer not null,
	CONSTRAINT fk_developers_developer_id FOREIGN KEY(developer_id) REFERENCES developers(id),
	CONSTRAINT fk_projects_project_id FOREIGN KEY(project_id) REFERENCES projects(id)
);

-- company_project
create table company_project(
	company_id integer not null,
	project_id integer not null,
	CONSTRAINT fk_companies_company_id FOREIGN KEY(company_id) REFERENCES companies(id),
	CONSTRAINT fk_projects_project_id FOREIGN KEY(project_id) REFERENCES projects(id)
);

-- customer_project
create table customer_project(
	customer_id integer not null,
	project_id  integer not null,
	CONSTRAINT fk_customers_customer_id FOREIGN KEY(customer_id) REFERENCES customers(id),
	CONSTRAINT fk_projects_project_id FOREIGN KEY(project_id) REFERENCES projects(id)
);