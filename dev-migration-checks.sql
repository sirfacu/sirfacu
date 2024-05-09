{ CALL bitnami_moodle.getProgramCoursesProgress("1", '11205') }
{ CALL bitnami_moodle.lxp_get_courses_catalog("AND mcc.id = 1291", 191592, "id DESC", 5, 0, 0, @cant)}
{ CALL bitnami_moodle.lxp_get_courses_catalog("AND mcc.id = 1291", 191592, "id DESC", 5, 0, 0, @cant)}
{ CALL bitnami_moodle.lxp_get_free_courses("191592", "id DESC", 20, 30, "id", 0, ?) }

{ CALL bitnami_moodle.lxp_get_info_program(2) }




use bitnami_moodle;
select * from logs_store_procedures 