create view participate_member (eid, uname, dept, edate)
AS SELECT e.id, u.full_name name, u.department dep, e.date
FROM participants AS p, user AS u, event AS e
WHERE e.id = p.event_id
AND p.user_id = u.id;

create view club_member_list (cid, name, dept, join_date)
AS SELECT m.club_id as cid, u.full_name name, u.department depm, m.join_date
FROM club_member AS m, user AS u
WHERE u.id = m.user_id;

create view clubHostEvent(cid, ename, edate, eid)
AS SELECT host.club_id, event.name, event.date, event.id
FROM event, host
WHERE host.event_id = event.id

