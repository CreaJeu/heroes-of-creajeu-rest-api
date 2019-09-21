create view hoc.view_heroes as
select hoc.heroes.id, name, creation_date, coalesce(sum(xp_bonus),0) as xp from hoc.heroes
left join hoc.ach_history on hoc.ach_history.hero_id=hoc.heroes.id
left join hoc.achievements on hoc.ach_history.ach_id=hoc.achievements.id
group by hoc.heroes.id
order by xp desc;
