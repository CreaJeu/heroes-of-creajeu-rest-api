-- TABLES --
create schema hoc;

create table hoc.heroes (
	id serial primary key,
	name varchar(50) not null unique,
	creation_date timestamp not null,
);

create table hoc.achievements (
	id serial primary key,
	title varchar(100) not null,
	description varchar(500) not null,
	xp_bonus integer not null,
);

create table hoc.ach_history (
	hero_id integer references hoc.heroes(id),
	ach_id integer references hoc.achievements(id),
	date timestamp not null,
	primary key(heroId, achId)
);

-- ROLES --
create role web_anon nologin; -- anonymous user with read-only privileges
grant usage on schema hoc to web_anon;
grant select on hoc.heroes to web_anon;
grant select on hoc.achievements to web_anon;
grant select on hoc.ach_history to web_anon;
grant select on hoc.view_heroes to web_anon;
grant select on hoc.view_history to web_anon;

create role authenticator noinherit login password 'bC42Vc8G'; -- for PostgREST middleware
grant web_anon to authenticator;
