CREATE TABLE elmasri.funcionario ( cpf CHAR(11) NOT NULL, primeiro_nome VARCHAR(15) NOT NULL, nome_meio CHAR(1), ultimo_nome VARCHAR(15) NOT NULL, data_nascimento DATE, endereco VARCHAR(100), sexo CHAR(1), salario NUMERIC(10,2), cpf_supervisor CHAR(11), numero_departamento INTEGER NOT NULL, CONSTRAINT pk_funcionario PRIMARY KEY (cpf) ); CREATE TABLE

CREATE TABLE elmasri.departamento numero_departamento INTEGER NOT NULL, nome_departamento VARCHAR(15) NOT NULL, cpf_gerente CHAR(11) NOT NULL, data_inicio_gerente DATE, CONSTRAINT pk_departamento PRIMARY KEY (numero_departamento) ); CREATE TABLE

           CREATE UNIQUE INDEX departamento_idx
           ON elmasri.departamento
           ( nome_departamento );
CREATE INDEX

             CREATE TABLE elmasri.projeto (
             numero_projeto INTEGER NOT NULL,
             nome_projeto VARCHAR(15) NOT NULL,
             local_projeto VARCHAR(15),
             numero_departamento INTEGER NOT NULL,
             CONSTRAINT pk_projeto PRIMARY KEY (numero_projeto)
); CREATE TABLE

CREATE UNIQUE INDEX projeto_idx ON elmasri.projeto ( nome_projeto ); CREATE INDEX

CREATE TABLE elmasri.localizacoes_departamento ( numero_departamento INTEGER NOT NULL, local VARCHAR(15) NOT NULL, CONSTRAINT pk_localizacoes_departamento PRIMARY KEY (numero_departamento, local) ); CREATE TABLE

CREATE TABLE elmasri.dependente ( cpf_funcionario CHAR(11) NOT NULL, nome_dependente VARCHAR(15) NOT NULL, sexo CHAR(1), data_nascimento DATE, parentesco VARCHAR(15), CONSTRAINT pk_dependente PRIMARY KEY (cpf_funcionario, nome_dependente) ); CREATE TABLE

CREATE TABLE elmasri.trabalha_em ( cpf_funcionario CHAR(11) NOT NULL, numero_projeto INTEGER NOT NULL, horas NUMERIC(3,1), CONSTRAINT pk_trabalha_em PRIMARY KEY (cpf_funcionario, numero_projeto) ); CREATE TABLE

         ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
         FOREIGN KEY (cpf_funcionario)
         REFERENCES elmasri.funcionario (cpf)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION
         NOT DEFERRABLE;
ALTER TABLE

         ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionario_dependente_fk
         FOREIGN KEY (cpf_funcionario)
         REFERENCES elmasri.funcionario (cpf)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION
         NOT DEFERRABLE;
ALTER TABLE

         ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionario_departamento_fk
         FOREIGN KEY (cpf_gerente)
         REFERENCES elmasri.funcionario (cpf)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION
         NOT DEFERRABLE;
ALTER TABLE

         ALTER TABLE elmasri.funcionario ADD CONSTRAINT funcionario_funcionario_fk
         FOREIGN KEY (cpf_supervisor)
         REFERENCES elmasri.funcionario (cpf)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION
         NOT DEFERRABLE;
ALTER TABLE

         ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
         FOREIGN KEY (numero_departamento)
         REFERENCES elmasri.departamento (numero_departamento)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION
         NOT DEFERRABLE;
ALTER TABLE

        ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk
        FOREIGN KEY (numero_departamento)
        REFERENCES elmasri.departamento (numero_departame
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
        NOT DEFERRABLE;
ALTER TABLE

       ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
       FOREIGN KEY (numero_projeto)
       REFERENCES elmasri.projeto (numero_projeto)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION
       NOT DEFERRABLE;
ALTER TABLE selectfrom elmasri.funionario; LINE 1: selectfrom elmasri.funionario; ^ select* from elmasri.funcionario; cpf | primeiro_nome | nome_meio | ultimo_nome | data_nascimento | endereco | sexo | salario | cpf_supervisor | numero_departamento -----+---------------+-----------+-------------+-----------------+----------+------+---------+----------------+--------------------- (0 rows)

 insert into elmasri.funcionario values (
 '88866555576' , 'jorge' , 'E' , 'Brito' , '1937-11-10' , 'Rua do Horto, 35, São Paulo,SP', 'M', '55000', NULL, '1');
INSERT 0 1

 insert into elmasri.funcionario values (
 (# '33344555587', 'Fernando', 'T', 'Wrong', '1955-12-08', 'Rua da Lapa,34, São Paulo,SP', 'M', '40000', '88866555576', '5');
INSERT 0 1

 insert into elmasri.funcionario values (
 (# '98765432168', 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av.Arthur de Lima,54,Santo André,SP', 'F', '43000', '88866555576', '4');
INSERT 0 1

 insert into elmasri.funcionario values (
 (# '12345678966', 'João', 'B', 'Silva', '1965-01-09', 'Rua das Flores,751,São Paulo,SP', 'M', '30000', '33344555587','5');
INSERT 0 1

  insert into elmasri.funcionario values (
uvv(# '99988777767', 'Alice', 'J', 'Zelaya', '1968-01-19', 'Rua Souza Lima,35,Curitiba,PR', 'F', '25000', '98765432168','4'); INSERT 0 1

  insert into elmasri.funcionario values (
  '66688444476', 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças,65,Piracicaba,SP', 'M', '38000', '33344555576', '5');
DETAIL: Key (cpf_supervisor)=(33344555576) is not present in table "funcionario".

   insert into elmasri.funcionario values (
   (# '45345345376', 'Joice', 'A', 'Leite', '1972-07-31', 'Av.Lucas Obes,74, São Paulo,SP', 'F', '25000', '33344555587', '5');
INSERT 0 1

   insert into elmasri.funcionario values (
   (# '98798798733', 'André', 'V', 'Pereira', '1969-03-29', 'Rua Timbira,35,São Paulo,SP', 'M', '25000', '98765432168', '4');
INSERT 0 1

   insert into elmasri.funcionario values (
   (# '66688444476', 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças,65,Piracicaba,SP', 'M', '38000', '33344555587', '5');
INSERT 0 1 select* from elmasri.funcionario; cpf | primeiro_nome | nome_meio | ultimo_nome | data_nascimento | endereco | sexo | salario | cpf_supervisor | numero_departamento -------------+---------------+-----------+-------------+-----------------+-------------------------------------+------+----------+----------------+--------------------- 88866555576 | jorge | E | Brito | 1937-11-10 | Rua do Horto, 35, São Paulo,SP | M | 55000.00 | | 1 33344555587 | Fernando | T | Wrong | 1955-12-08 | Rua da Lapa,34, São Paulo,SP | M | 40000.00 | 88866555576 | 5 98765432168 | Jennifer | S | Souza | 1941-06-20 | Av.Arthur de Lima,54,Santo André,SP | F | 43000.00 | 88866555576 | 4 12345678966 | João | B | Silva | 1965-01-09 | Rua das Flores,751,São Paulo,SP | M | 30000.00 | 33344555587 | 5 99988777767 | Alice | J | Zelaya | 1968-01-19 | Rua Souza Lima,35,Curitiba,PR | F | 25000.00 | 98765432168 | 4 45345345376 | Joice | A | Leite | 1972-07-31 | Av.Lucas Obes,74, São Paulo,SP | F | 25000.00 | 33344555587 | 5 98798798733 | André | V | Pereira | 1969-03-29 | Rua Timbira,35,São Paulo,SP | M | 25000.00 | 98765432168 | 4 66688444476 | Ronaldo | K | Lima | 1962-09-15 | Rua Rebouças,65,Piracicaba,SP | M | 38000.00 | 33344555587 | 5 (8 rows)

         insert into elmasri.departamento values (
         ( '5', 'pesquisa', '33344555587', '1988-05-22');
INSERT 0 1

          insert into elmasri.departamento values (
         ( '4', 'administração','98765432168', '1995-01-01);

          insert into elmasri.departamento values (
         '1', 'Matriz', '88866555576', '1981-06-19');


         insert into elmasri.departamento values (
         4', 'administração', '98765432168', '1995-06-19');
         select* from elmasri.departamento;

         select* from elmasri.departamento;
         select* from elmasri.departamento;
         insert into elmasri.departamento values (
        '5', 'pesquisa', '33344555587', '1988-05-22');
         insert into elmasri.departamento values (
        '4', 'administração','98765432168', '1995-01-01);

        LINE 5: '1', 'Matriz', '88866555576', '1981-06-19');
        ^

        insert into elmasri.departamento values (
        ( '1', 'Matriz', '88866555576', '1981-06-19');
INSERT 0 1

        insert into elmasri.departamento values (
        ( '4', 'administração', '98765432168', '1995-06-19');
INSERT 0 1 select* from elmasri.departamento; numero_departamento | nome_departamento | cpf_gerente | data_inicio_gerente ---------------------+-------------------+-------------+--------------------- 5 | pesquisa | 33344555587 | 1988-05-22 1 | Matriz | 88866555576 | 1981-06-19 4 | administração | 98765432168 | 1995-06-19 (3 rows)

         insert into elmasri.localizacoes_departamento values (
         ( '1','São Paulo');
INSERT 0 1 insert into elmasri.localizacoes_departamento values ( ( '4','Mauá'); INSERT 0 1

        insert into elmasri.localizacoes_departamento values (
        ( '5', 'Santo André');
INSERT 0 1

        insert into elmasri.localizacoes_departamento values (
        ( '5', 'Itu');
INSERT 0 1 insert into elmasri.localizacoes_departamento values ( ( '5', 'São Paulo'); INSERT 0 1 insert into elmasri.projeto values ( ( '1', 'ProdutoX','Santo André', '5'); INSERT 0 1 insert into elmasri.projeto values ( ( '2', 'ProdutoY', 'Itu', '5'); INSERT 0 1 insert into elmasri.projeto values ( ( '3','ProdutoZ', 'São Paulo', '5'); INSERT 0 1 insert into elmasri.projeto values ( ( '10', 'Informatização', 'Mauá', '4'); INSERT 0 1 insert into elmasri.projeto values ( ( '20', 'Reorganização', 'São Paulo', '1'); INSERT 0 1 insert into elmasri.projeto values ( ( '30', 'Novosbeneficios', 'Mauá', '4'); INSERT 0 1 insert into elmasri.dependente values ( ( '33344555587', 'Alicia', 'F', '1986-04-05', 'filha'); INSERT 0 1 insert into elmasri.dependente values ( ( '33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'); INSERT 0 1

        insert into elmasri.dependente values (
        ( '33344555587', 'Janaina', 'F','1958-05-03', 'Esposa');
INSERT 0 1

        insert into elmasri.dependente values (
        ( '98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');
INSERT 0 1

        insert into elmasri.dependente values (
        ( '12345678966', 'Michael', 'M', '1988-01-04', 'Filho');
INSERT 0 1

        insert into elmasri.dependente values (
         ( '12345678966', 'Alicia', 'F', '1988-12-30', 'filha');
INSERT 0 1 insert into elmasri.dependente values ( ( '12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa'); INSERT 0 1 insert into elmasri.trabalha_em values ( ( '12345678966', '1', '32.2'); INSERT 0 1 insert into elmasri.trabalha_em valuesn ( ( '12345678966', '2', '7.5'); INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '66688444476', '3', '40.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '45345345376', '2', '20.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '33344555587', '2', '20.0');
INSERT 0 1 insert into elmasri.trabalha_em values ( ( '33344555587', '3', '10.0'); INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '33344555587', '10','10.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '33344555587', '20', '10.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '99988777767', '30', '30.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '99988777767', '10', '10.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '98798798733', '10', '35.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '98798798733', '30', '5.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '98765432168', '30', '20.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '98765432168', '20', '15.0');
INSERT 0 1

         insert into elmasri.trabalha_em values (
         ( '88866555576','20',NULL);
