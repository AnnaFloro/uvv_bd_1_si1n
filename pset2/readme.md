----PSET2


--Questão 1:Mostre a média salarial dos funcionários de cada departamento

select AVG (salario) AS mediasalarial, nome_departamento 
AS departamento from elmasri.funcionario AS f 
inner join elmasri.departamento AS d ON (f.numero_departamento = d.numero_departamento)
group by nome_departamento;
 
 
 --Questão 2: Mostre a média salarial dos homens e das mulheres
 
 select AVG(salario) AS mediasalarial, sexo 
 from elmasri.funcionario
 group by sexo;
 

--Questão 3:Liste o nome dos departamentos e, para cada departamento, inclua as seguintes informações de seus funcionários: o nome
completo, a data de nascimento, a idade em anos completos e o salário. 

select nome_departamento, concat(primeiro_nome,' ', nome_meio,' ', ultimo_nome) 
as nome_completo_funcionario, data_nascimento, date_part('year', CURRENT_DATE) - date_part('year', data_nascimento) AS idade
, salario from elmasri.funcionario f
inner join elmasri.departamento dp on (f.numero_departamento = dp.numero_departamento); 


--Questão 4:mostre o nome completo dos funcionários, a idade em anos completos, o salário atual e o salário com um reajuste que
obedece ao seguinte critério: se o salário atual do funcionário é inferior a 35.000 o
reajuste deve ser de 20%, e se o salário atual do funcionário for igual ou superior a
35.000 o reajuste deve ser de 15%

select nome_departamento, concat(primeiro_nome,' ', nome_meio,' ', ultimo_nome) 
as nome_completo_funcionario, data_nascimento, date_part('year', CURRENT_DATE) - date_part('year', data_nascimento) AS idade
, salario from elmasri.funcionario f
inner join elmasri.departamento dp on (f.numero_departamento = dp.numero_departamento);  


--Questão 5:Liste, para cada departamento, o nome do gerente e o nome dos funcionários. 
Ordene esse relatório por nome do departamento (em ordem crescente) e por salário dos funcionários (em ordem decrescente).

select nome_departamento, case
WHEN dp.numero_departamento = 1 THEN 'Jorge'
WHEN dp.numero_departamento = 4 THEN 'Jennifer'
WHEN dp.numero_departamento = 5 THEN 'Fernando'
END  nome_gerente, 
(primeiro_nome)  as nome_funcionario,
(salario) aS salario_funcionario from elmasri.departamento dp
inner join elmasri.funcionario f ON (f.numero_departamento = dp.numero_departamento);


--Questão 6:mostre o nome completo dos funcionários que têm dependentes, o departamento onde eles trabalham e, para cada funcionário, também liste o nome completo dos dependentes, a idade em anos de cada
dependente e o sexo (o sexo NÃO DEVE aparecer como M ou F, deve aparecer
como “Masculino” ou “Feminino”).

select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo, dp.nome_departamento, d.nome_dependente, 
 d.parentesco, d.data_nascimento, CURDATE as data atual, TIMESTAMPDIFF(ano, d.data_nascimento, current_date() as idade_dependente, 
 case when d.sexo = "M" then "Masculino"
      when d.sexo = "F" then "Feminino"
 END AS  sexo
 FROM elmasri.funcionario AS f
 inner join departamento AS dp ON (f.numero_departamento = dp.numero_departamento)
 inner join dependente AS d ON (f.cpf = d.cpf_funcionario);


--Questão 7:Mostre, para cada funcionário que não tem dependente, seu nome completo, departamento e salário.

select concat (primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo_funcionario,
f. numero_departamento as departamento, (salario) from elmasri.funcionario f
left outer join elmasri.dependente d on (f.cpf = d.cpf_funcionario)
where cpf_funcionario is NULL;


--Questão 8:Mostre, para cada departamento, os projetos desse departamento e o nome completo dos funcionários que estão alocados
em cada projeto. Além disso inclua o número de horas trabalhadas por cada funcionário, em cada projeto

 select p.nome_projeto AS projeto,CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome)	as funcionario, 
  SUM(horas) as horas from elmasri.funcionario f
  inner join elmasri.trabalha_em te on (f.cpf = te.cpf_funcionario)
  inner join elmasri.projeto p ON ( te.numero_projeto = p.numero_projeto)
  WHERE f.cpf = te.cpf_funcionario
  group by f.numero_departamento, p.nome_projeto, funcionario
  order by projeto;
  
  
  --Questão 9:mostre a soma total das horas de cada projeto em cada departamento. Obs.: o relatório deve exibir o nome do departamento, 
  o nome do projeto e a soma total das horas.
  
select  nome_departamento, nome_projeto,
sum(horas) as soma_horas
from elmasri.departamento  dp
inner join elmasri.projeto p ON (dp.numero_departamento = p.numero_departamento)
inner join elmasri.trabalha_em t ON (p.numero_projeto = t.numero_projeto)
GROUP BY nome_departamento, nome_projeto;


--Questão 10:Mostre a média salarial dos funcionários de cada departamento

select AVG (salario) AS mediasalarial, nome_departamento 
AS departamento from elmasri.funcionario AS f 
inner join elmasri.departamento AS d ON (f.numero_departamento = d.numero_departamento)
group by nome_departamento;


--Questão 11:Considerando que o valor pago por hora trabalhada em um projeto
é de 50 reais, prepare um relatório que mostre o nome completo do funcionário, 
o nome do projeto e o valor total que o funcionário receberá referente às horas trabalhadas naquele projeto.

select concat(f.primeiro_nome, '', f.nome_meio, '', f.ultimo_nome) as nome_completo,p.nome_projeto, t.horas * 50 
as valor_recebido from elmasri.funcionario as f 
inner join departamento AS d ON (f.numero_departamento = d.numero_departamento)
inner join trabalha_em AS t ON (f.cpf = t.cpf_funcionario)
inner join projeto AS p ON (t.numero_projeto = p.numero_projeto)
where f.cpf = t.cpf_funcionario
order by nome_completo,nome_projeto;


--Questão 12:Liste o nome do departamento, o nome do projeto e o nome dos funcionários que,
mesmo estando alocados a algum projeto, não registraram nenhuma hora trabalhada.

select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) 
as nome_completo,d.nome_departamento,p.nome_projeto, t.horas = 0 AS Horas
from elmasri.funcionario as f 
inner join departamento AS d ON (f.numero_departamento = d.numero_departamento)
inner join trabalha_em AS t ON (f.cpf = t.cpf_funcionario)
inner join projeto AS p ON (t.numero_projeto = p.numero_projeto)
where f.cpf = t.cpf_funcionario;


--Questão 13:Durante o natal deste ano a empresa irá presentear todos os funcionários e todos os dependentes (sim, a empresa vai dar um presente para cada
funcionário e um presente para cada dependente de cada funcionário) e pediu para que você preparasse um relatório que listasse o nome completo das pessoas a serem
presenteadas (funcionários e dependentes), o sexo e a idade em anos completos (para poder comprar um presente adequado).
Esse relatório deve estar ordenado pela idade em anos completos, de forma decrescente

select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo_func, 
concat(d.nome_dependente, ' ', f.ultimo_nome) as nome_completo_dep, 
 f.sexo AS sexo_func, d.sexo AS sexo_dep, current_date() as data atual, TIMESTAMPDIFF(year, f.data_nascimento, current_date() as idade_func, 
 TIMESTAMPDIFF(year, d.data_nascimento, current_date () as idade_dep from elmasri.funcionario as f
 left outer join dependente as d on (f.cpf = d.cpf_funcionario)
 group by nome_completo_func, nome_completo_dep
 order by idade_func DESC;
 
 
 --Questão 14:Prepare um relatório que exiba quantos funcionários cada departamento tem.
 
select d.nome_departamento, COUNT(*) AS total_funcinarios
from elmasri.funcionario as f
inner join departamento as d on 
(f.numero_departamento = d.numero_departamento)
group by (nome_departamento);


--Questão 15:Exiba o nome completo do funcionário, o departamento desse funcionário e o nome dos projetos em que cada funcionário está alocado.
Atenção: se houver algum funcionário que não está alocado em nenhum projeto, nome completo e o departamento também devem aparecer no relatório.

select concat(primeiro_nome,' ', nome_meio,' ', ultimo_nome)
as (nome, d.nome_departamento AS departamento, p.nome_projeto) as projeto
from elmasri.funcionario f
inner join departamento d ON (d.numero_departamento = f.numero_departamento)
inner join projeto p ON (p.numero_departamento = d.numero_departamento);





