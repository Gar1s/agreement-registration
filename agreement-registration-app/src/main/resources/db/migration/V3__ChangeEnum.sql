alter table agreements alter column practice_type type varchar;
alter table agreements drop constraint agreements_practice_type_check;

update agreements
set practice_type = case
                        when practice_type = 'MANUFACTURE' then 'Виробнича'
                        when practice_type = 'STUDY' then 'Навчальна'
                        when practice_type = 'PRE_DIPLOMA' then 'Переддипломна'
                        when practice_type = 'TECHNOLOGICAL' then 'Навчально-технологічна'
                        else practice_type
end;