SELECT
D.CUIIO,
'RIND ' ||D.RIND ||' - '|| SUM(D.COL14)   
  
  AS REZULTAT
   
FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
  
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
 -- (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (40)  AND
  D.CAPITOL IN (1022) AND
  R.NTII =  40
  
  GROUP BY
  D.CUIIO, 
  D.RIND

HAVING
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN 1022 AND D.RIND IN ('20','21','30') THEN D.COL14 ELSE 0 END)) > 0 
  
