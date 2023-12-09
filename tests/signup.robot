*** Settings ***
Documentation    Suite de testes de cadastro de Dog Walker

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Finish Session

*** Test Cases ***
Deve poder cadastrar um novo Dog Walker

    [Tags]    smoke

    ${dog_walker}       Create Dictionary        
    ...    name=Dominic Torreto   
    ...    email=torreto@gmail.com   
    ...    cpf=00000000020
    ...    cep=14050200
    ...    number=215
    ...    details=Apto 00
    ...    street=Rua Capitão Pereira Lago
    ...    district=Vila Tibério
    ...    cityUf=Ribeirão Preto/SP
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv

    ${dog_walker}       Create Dictionary        
    ...    name=Dominic Torreto   
    ...    email=torreto@gmail.com   
    ...    cpf=0000000002a
    ...    cep=14050200
    ...    number=215
    ...    details=Apto 00
    ...    street=Rua Capitão Pereira Lago
    ...    district=Vila Tibério
    ...    cityUf=Ribeirão Preto/SP
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido

 Não deve poder cadastrar se os campos obrigatórios não forem preenchidos.
     [Tags]    required

    # ${dog_walker}       Create Dictionary        
    # ...    name=Dominic Torreto   
    # ...    email=torreto@gmail.com   
    # ...    cpf=00000000020
    # ...    cep=14050200
    # ...    number=215
    # ...    details=Apto 00
    # ...    street=Rua Capitão Pereira Lago
    # ...    district=Vila Tibério
    # ...    cityUf=Ribeirão Preto/SP
    # ...    cnh=toretto.jpg

    Go to signup page
    #Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo Dog Walker que sabe cuidar de pets

    [Tags]    aservice

    ${dog_walker}       Create Dictionary        
    ...    name=Dominic Torreto   
    ...    email=torreto@gmail.com
    ...    cpf=00000000020
    ...    cep=14050200
    ...    number=215
    ...    details=Apto 00
    ...    street=Rua Capitão Pereira Lago
    ...    district=Vila Tibério
    ...    cityUf=Ribeirão Preto/SP
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo Dog Walker que sabe adestrar pets

    [Tags]    aservice

    ${dog_walker}       Create Dictionary        
    ...    name=Dominic Torreto   
    ...    email=torreto@gmail.com
    ...    cpf=00000000020
    ...    cep=14050200
    ...    number=215
    ...    details=Apto 00
    ...    street=Rua Capitão Pereira Lago
    ...    district=Vila Tibério
    ...    cityUf=Ribeirão Preto/SP
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

*** Keywords ***