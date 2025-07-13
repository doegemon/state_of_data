{{ config(materialized = 'table', schema = 'gold', alias = 'data_exp_salary') }}

SELECT
	years_data_experience,
	salary_range,
	count(distinct survey_id) AS total_responses
FROM
	{{ ref( 'work' ) }}
GROUP BY
	1, 2
