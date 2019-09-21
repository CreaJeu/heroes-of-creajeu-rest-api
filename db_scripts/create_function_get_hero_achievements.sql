CREATE FUNCTION hoc.get_hero_achievements (target_hero_id integer)
RETURNS TABLE (
ach_id integer,
ach_title VARCHAR,
ach_xp_bonus integer,
ach_obtained date
)
AS $$
DECLARE 
    var_r record;
BEGIN
FOR var_r IN(
	 SELECT id,title,xp_bonus,date
	 FROM hoc.achievements, hoc.ach_history
	 where hoc.ach_history.hero_id=target_hero_id
	 and hoc.ach_history.ach_id = hoc.achievements.id
)
LOOP
	ach_id := var_r.id;
	ach_title := var_r.title;
	ach_xp_bonus := var_r.xp_bonus;
	ach_obtained := var_r.date;
	RETURN NEXT;
END LOOP;
END; $$
 
LANGUAGE 'plpgsql';
