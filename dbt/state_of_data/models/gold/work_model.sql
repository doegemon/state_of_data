{{ config(materialized = 'table', schema = 'gold', alias = 'work_model_salary') }}

SELECT
	current_work_policy,
	count(distinct survey_id) AS total_responses
FROM
	{{ ref( 'work' ) }}
GROUP BY
	1
