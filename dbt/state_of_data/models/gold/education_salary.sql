{{ config(materialized = 'table', schema = 'gold', alias = 'education_salary') }}

SELECT
	d.education_level,
	d.education_area,
	w.salary_range,
	count(distinct d.survey_id) AS total_responses,
	AVG(d.age) AS average_age
FROM
	{{ ref( 'demographics' ) }} AS d
LEFT JOIN
	{{ ref( 'work' ) }} AS w
	ON
		d.survey_id = w.survey_id
GROUP BY
	1, 2, 3
