-- Which of Londons stadiums is the biggest

SELECT *
FROM stadiums s
JOIN (SELECT MAX(capacity) as capacity FROM stadiums WHERE city = 'London')  ss
ON s.capacity = ss.capacity;

-- Which stadium that is not in London contains letter 'V' or 'T' and its capacity is an odd number

SELECT *
FROM stadiums
WHERE city NOT IN ('London') 
           AND capacity %2 = 1 
		   AND stadium_name REGEXP 'V|T';
			
-- What was an average attendace when home_team scored more than 2 goals and won a game

CREATE VIEW results AS (
SELECT home_team, away_team, goals_home, away_goals, IF(goals_home > away_goals, 'won', 'not won') as result, attendance
FROM season_history);

SELECT AVG(attendance) as avg_attendance
FROM results
WHERE goals_home >= 2 AND result = 'won';

-- Find teams which scored more goals than the league average

SELECT *

FROM (SELECT team, (SUM(goals_home) + SUM(away_goals)) as total_scored
FROM season_history sh
JOIN stadiums s USING(stadium_id)
GROUP BY team) total_team_goals

JOIN (SELECT AVG(total_scored) as league_avg_scored
FROM (
SELECT team, (SUM(goals_home) + SUM(away_goals)) as total_scored
FROM season_history sh
JOIN stadiums s USING(stadium_id)
GROUP BY team
) x)avg_league_goal

ON total_team_goals.total_scored > avg_league_goal.league_avg_scored

-- Rank the most brutal teams in the league DESC (red cards)

CREATE VIEW red_cards AS(
SELECT team, SUM(home_red + away_red) as red
FROM season_history
JOIN stadiums USING(stadium_id)
GROUP BY team
ORDER BY red DESC
);

SELECT * FROM premier_league.red_cards;

SELECT team, red, RANK() OVER(ORDER BY red DESC) as ranking
FROM red_cards;

-- Which home_fans see their team on the ball for the biggest amount of time (per avg possession)

SELECT home_team, avg_pos, RANK() OVER(ORDER BY avg_pos DESC) as rank_pos
FROM(
SELECT home_team, AVG(home_possessions) as avg_pos
FROM season_history
GROUP BY home_team
) x;

-- What is each team shot -> goal conversion rate and group them into ELITE, NORMAL, BELOWPAR

SELECT home_team,
	  CASE	
		  WHEN ratio >= 23 THEN 'ELITE'
          WHEN ratio BETWEEN 19 AND 22 THEN 'NORMAL'
          ELSE 'BELOWPAR'
          END AS Ratio_rank
FROM (SELECT home_team, CAST(MAX(home_shots / goals_home) as decimal(3,1)) as ratio
FROM season_history
GROUP BY home_team
) x




