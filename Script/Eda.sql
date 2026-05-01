--Nuestro EDA
/*

1. **Antigüedad:** ¿Cuál es el promedio de antigüedad de los empleados en cada departamento?
2. **Retención:** ¿Cuántos empleados en cada departamento siguen trabajando actualmente en la empresa?
3. **Satisfacción vs. Antigüedad:** ¿Cómo se compara la satisfacción laboral de los empleados en diferentes niveles de antigüedad?
4. **Horas Extras:** ¿Qué porcentaje de empleados que trabajan horas extras han dejado la empresa?
5. **Desempeño por Viajes:** Clasificar los departamentos por el promedio de calificación de los gerentes, desglosado por frecuencia de viajes de negocios.
6. **Capacitación:** ¿Existe una correlación positiva entre el número de oportunidades de capacitación tomadas y la satisfacción laboral?
7. **Talento Top:** Identificar a los tres mejores empleados según la calificación de su gerente en cada departamento.
8. **Distancia al Trabajo:** Categorizar a los empleados según su distancia al trabajo y mostrar el promedio de satisfacción laboral en cada categoría.
9. **Promociones y Liderazgo:** ¿Existe una relación entre el número de ascensos y los años que un empleado ha pasado con su gerente actual?
10. **Alerta de Rotación:** Para cada departamento, identificar el porcentaje de empleados que se han ido y que tenían una puntuación de satisfacción laboral inferior a 3.
*/
--1. **Antigüedad:** ¿Cuál es el promedio de antigüedad de los empleados en cada departamento?
SELECT Department
		,avg(YearsAtCompany*1.0)  permanencia_promedio
FROM Employee
group by Department
--2. **Retención:** ¿Cuántos empleados en cada departamento siguen trabajando actualmente en la empresa?
select Attrition ,*
from Employee

;
SELECT Department
		,count(*)
		--,subconsultas
		--count condicionado
		,sum(case when Attrition ='No' then 1 else 0 end ) empleados_actuales_1
		,(select count(1) from Employee E1 where E1.Department=E2.Department  and Attrition ='No') empleados_actuales_2
FROM Employee E2
group by Department
;
--3. **Satisfacción vs. Antigüedad:** 
--¿Cómo se compara la satisfacción laboral de los empleados en diferentes niveles de antigüedad?
with base_rango_etario as  (
	select *
		 ,case --inicio
			when YearsAtCompany<3  then '<3 years'
			when YearsAtCompany>=3 and YearsAtCompany<5   then '3-5 years'
			else '>5 years'
		  end  rango_etario --fin 
		
	from Employee
)
select * 
from base_rango_etario


