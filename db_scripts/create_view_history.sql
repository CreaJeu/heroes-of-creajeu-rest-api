create view hoc.view_history as
select date, hoc.heroes.id as hero_id, name as hero_name, hoc.achievements.id as ach_id, title as ach_title from hoc.ach_history
left join hoc.heroes on hoc.ach_history.hero_id=hoc.heroes.id
left join hoc.achievements on hoc.ach_history.ach_id=hoc.achievements.id
