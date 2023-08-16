*** Settings ***
Library        SeleniumLibrary
Library        DebugLibrary
Library        BuiltIn
Library        Collections

*** Variables ***

@{LIST_STR_NUM}    A    1    B    2    C    3    
@{LIST_STR}        banana    manga    limão    abacate    melancia 
&{DICT_PESSOA}    
...                nome=Rayane
...                idade=26
...                rua=Av. José Barbosa de Siqueira
...                numero=1495
...                cep=06172002
...                bairro=Padroeira
...                cidade=Osasco
...                estado=SP
${ANO_NASC}
${ELEMENT}

# 1 - Exercício Dicionário
  #Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionário

# 2 - Exercício Argumentos e Retornos + If Simples
  #Criar uma keyword que receba idade e retorne o ano de nascimento
  #Se o ano for menor que 2000, exibir mensagem dizendo que nasceu no século passado

# 3 - Exercício For Simples + Lista
  #Exiba cada uma das frutas de uma lista usando um For Simples

# 4 - Exercício If Inline + For in Range
  # Crie um loop que conte quantos números par existem entre 0 e 10, usando if inline

# Extra - Exercício Try + Except + Finally
  #A partir da lista ["A", 1, "B", 2, "C" e 3], adicionar somente os números numa nova lista
  #tratar os caracteres como exceção e exibir a nova lista a cada iteração usando Finally.


*** Test Cases ***
Executar Dicionario
   Log to console   ${DICT_PESSOA}

Argumentos e Retornos
   Retornar o ano de nascimento

If Simples   
   Exibir mensagem

For Simples
    Exibir Lista de Frutas

If Inline + For in Range
    Exibir números pares entre 0 e 10
    
Try + Except + Finally
    Adicionar somente os números numa nova lista    

*** Keywords ***
Retornar o ano de nascimento

  [Arguments]     ${ANO_ATUAL}=2023    ${IDADE}=26 
    
    ${ANO_NASC}     Evaluate    ${ANO ATUAL} - ${IDADE}
  [Return]     ${ANO_NASC}

Exibir mensagem

  Log To Console    ${EMPTY}
    IF    '${ANO_NASC} < 2000'
  Log To Console    Nasceu no século passado
    ELSE
  Log To Console    ${ANO_NASC}
    END

Exibir Lista de Frutas

  Log To Console    ${EMPTY}
    FOR    ${i}    IN    @{LIST_STR}
  Log To Console    ${i}
    END

Exibir números pares entre 0 e 10
    
    FOR     ${ÍNDICE}  IN RANGE   11
    ${NUMEROS_PARES}=   Evaluate     ${ÍNDICE} % 2
    IF  ${NUMEROS_PARES} == 0   Log To Console   ${ÍNDICE}
    END

Adicionar somente os números numa nova lista
    @{LIST_NUM}  create list 
    FOR     ${ELEMENTO}    IN    @{LIST_STR_NUM}
      TRY
        Run Keyword If    '${ELEMENTO}' in ['1', '2', '3']  Append To List  ${LIST_NUM}  ${ELEMENTO}
      EXCEPT
        Run Keyword If    '${ELEMENTO}' in ['A', 'B', 'C']
      FINALLY
        Log To Console    ${LIST_NUM}
      END
    END

    





