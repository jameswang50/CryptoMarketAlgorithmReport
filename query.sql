select t1.algorithm, t1.trannsactions_Q1, t2.trannsactions_Q2, t3.trannsactions_Q3, t4.trannsactions_Q4 from (SELECT c.algorithm, SUM(volume) as trannsactions_Q1 FROM coins c JOIN transactions t ON c.code = t.coin_code WHERE EXTRACT(YEAR FROM t.dt) = 2020  AND QUARTER(t.dt) = 1 GROUP BY c.algorithm ORDER BY c.algorithm) as t1
JOIN (SELECT c.algorithm, SUM(volume) as trannsactions_Q2 FROM coins c JOIN transactions t ON c.code = t.coin_code WHERE EXTRACT(YEAR FROM t.dt) = 2020  AND QUARTER(t.dt) = 2 GROUP BY c.algorithm ORDER BY c.algorithm) as t2 
ON t2.algorithm = t1.algorithm
JOIN (SELECT c.algorithm, SUM(volume) as trannsactions_Q3 FROM coins c JOIN transactions t ON c.code = t.coin_code WHERE EXTRACT(YEAR FROM t.dt) = 2020  AND QUARTER(t.dt) = 3 GROUP BY c.algorithm ORDER BY c.algorithm) as t3
ON t3.algorithm = t1.algorithm
JOIN (SELECT c.algorithm, SUM(volume) as trannsactions_Q4 FROM coins c JOIN transactions t ON c.code = t.coin_code WHERE EXTRACT(YEAR FROM t.dt) = 2020  AND QUARTER(t.dt) = 4 GROUP BY c.algorithm ORDER BY c.algorithm) as t4
ON t4.algorithm = t1.algorithm
