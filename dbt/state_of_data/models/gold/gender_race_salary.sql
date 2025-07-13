{{ config(materialized = 'table', schema = 'gold', alias = 'gender_race_salary') }}

SELECT
	d.gender,
	d.race,
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
